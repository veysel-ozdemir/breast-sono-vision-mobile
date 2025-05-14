import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

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

    debugPrint('Notification has been scheduled at $scheduledDate');
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await notificationsPlugin.cancelAll();
  }
}
