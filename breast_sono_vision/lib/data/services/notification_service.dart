import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  // Key for storing notification times in SharedPreferences
  static const _notificationTimesKey = 'notification_times';

  final RxBool _isInitialized = RxBool(false);

  bool get isInitialized => _isInitialized.value;

  // INITIALIZE
  Future<void> initNotification() async {
    debugPrint(
        'Starting initialization of notifications -- current status: $_isInitialized');
    if (_isInitialized.value) return; // prevent re-initialiation

    // init timezone handling
    debugPrint('Initializing timezone...');
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    debugPrint('Timezone initialized: $currentTimeZone');

    // prepare android init settings
    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    // prepare ios init settings
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // init settings
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    // finally, initialize the plugin
    _isInitialized.value =
        await notificationsPlugin.initialize(initSettings) ?? false;
    debugPrint(
        'End of notifications initialization -- current status: $_isInitialized');
  }

  // NOTIFICATIONS DETAIL SETUP
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notification',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  // SHOW NOTIFICATION
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
    );
  }

  // SCHEDULED NOTIFICATION AT A SPECIFIC TIME
  Future<void> scheduleNotification({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    // Get the current date/time in device's local timezone
    final now = tz.TZDateTime.now(tz.local);

    // Create a date/time for today at the specified hour/min
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // Schedule the notification
    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails(),
      // Android specific: Allow notification while device is in low-power mode
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      // Make notification repeat DAILY at same time
      matchDateTimeComponents: DateTimeComponents.time,
    );

    // Store the time information
    _saveNotificationTime(id, hour, minute);

    debugPrint('Notification has been scheduled at $scheduledDate');
  }

  // Save notification time information
  Future<void> _saveNotificationTime(int id, int hour, int minute) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Get the existing times Map
      final String? timesJson = prefs.getString(_notificationTimesKey);
      Map<String, dynamic> times = {};
      if (timesJson != null) {
        times = jsonDecode(timesJson) as Map<String, dynamic>;
      }

      // Save the time for this notification ID
      times[id.toString()] = {
        'hour': hour,
        'minute': minute,
      };

      // Store back to shared preferences
      await prefs.setString(_notificationTimesKey, jsonEncode(times));
      debugPrint('Saved notification time for ID $id: $hour:$minute');
    } catch (e) {
      debugPrint('Error saving notification time: $e');
    }
  }

  // Get notification time for a specific ID
  Future<TimeOfDay?> getNotificationTime(int id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? timesJson = prefs.getString(_notificationTimesKey);

      if (timesJson == null) return null;

      final Map<String, dynamic> times =
          jsonDecode(timesJson) as Map<String, dynamic>;
      final timeData = times[id.toString()];

      if (timeData == null) return null;

      return TimeOfDay(
        hour: timeData['hour'] as int,
        minute: timeData['minute'] as int,
      );
    } catch (e) {
      debugPrint('Error getting notification time: $e');
      return null;
    }
  }

  // Get all notification times
  Future<Map<int, TimeOfDay>> getAllNotificationTimes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? timesJson = prefs.getString(_notificationTimesKey);

      if (timesJson == null) return {};

      final Map<String, dynamic> times =
          jsonDecode(timesJson) as Map<String, dynamic>;
      final Map<int, TimeOfDay> result = {};

      times.forEach((key, value) {
        final id = int.parse(key);
        result[id] = TimeOfDay(
            hour: value['hour'] as int, minute: value['minute'] as int);
      });

      return result;
    } catch (e) {
      debugPrint('Error getting all notification times: $e');
      return {};
    }
  }

  // Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await notificationsPlugin.pendingNotificationRequests();
  }

  // Cancel a specific notification
  Future<void> cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);

    // Also remove from stored times
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? timesJson = prefs.getString(_notificationTimesKey);

      if (timesJson != null) {
        final Map<String, dynamic> times =
            jsonDecode(timesJson) as Map<String, dynamic>;
        times.remove(id.toString());
        await prefs.setString(_notificationTimesKey, jsonEncode(times));
      }
    } catch (e) {
      debugPrint('Error removing notification time: $e');
    }

    debugPrint('Notifications with ID $id have been cancelled');
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await notificationsPlugin.cancelAll();

    // Clear all stored times
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_notificationTimesKey);
    } catch (e) {
      debugPrint('Error clearing notification times: $e');
    }

    debugPrint('All notifications have been cancelled');
  }

  // UPDATE SCHEDULED NOTIFICATION (e.g., for language change)
  Future<void> updateScheduledNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    try {
      // Get the original scheduled time
      final TimeOfDay? originalTime = await getNotificationTime(id);

      if (originalTime == null) {
        debugPrint(
            'Cannot update notification $id: Original schedule time not found.');
        return;
      }

      // Cancel the existing notification (without removing from SharedPreferences yet,
      // as scheduleNotification will handle updating/re-saving it)
      await notificationsPlugin.cancel(id);
      debugPrint('Cancelled notification $id for update.');

      // Schedule the notification with the new title and body, but original time
      await scheduleNotification(
        id: id,
        title: title,
        body: body,
        hour: originalTime.hour,
        minute: originalTime.minute,
      );

      debugPrint('Notification $id updated with new title/body.');
    } catch (e) {
      debugPrint('Error updating scheduled notification $id: $e');
    }
  }

  // UPDATE ALL SCHEDULED NOTIFICATIONS (e.g., for language change)
  Future<void> updateAllScheduledNotifications({
    required String title,
    required String body,
  }) async {
    try {
      final Map<int, TimeOfDay> allTimes = await getAllNotificationTimes();

      if (allTimes.isEmpty) {
        debugPrint('No scheduled notifications found to update.');
        return;
      }

      for (final entry in allTimes.entries) {
        final int id = entry.key;
        // The updateScheduledNotification method already handles fetching the time,
        // cancelling, and rescheduling with the original time.
        await updateScheduledNotification(id: id, title: title, body: body);
      }

      debugPrint(
          'All scheduled notifications have been updated with new title/body.');
    } catch (e) {
      debugPrint('Error updating all scheduled notifications: $e');
    }
  }

  // Get number of scheduled notifications and generate a new ID
  Future<int> getNextNotificationId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? timesJson = prefs.getString(_notificationTimesKey);

      if (timesJson == null) return 1;

      final Map<String, dynamic> times =
          jsonDecode(timesJson) as Map<String, dynamic>;

      if (times.isEmpty) return 1;

      // Find the highest existing ID and add 1
      int highestId = 0;
      for (String key in times.keys) {
        final int id = int.parse(key);
        if (id > highestId) {
          highestId = id;
        }
      }

      return highestId + 1;
    } catch (e) {
      debugPrint("Failed to generate next notification ID: $e");
      return 1; // Fallback to ID 1 if there's an error
    }
  }
}
