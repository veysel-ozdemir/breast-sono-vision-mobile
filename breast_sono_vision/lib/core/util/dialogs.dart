import 'package:breast_sono_vision/core/theme/color_palette.dart';
import 'package:breast_sono_vision/data/services/notification_service.dart';
import 'package:breast_sono_vision/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

Future<void> showDisclaimerDialog({
  required BuildContext context,
  required void Function()? onPressed,
}) async {
  final alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    contentPadding: EdgeInsets.zero,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InfoCard(
          icon: '🚨',
          title: 'disclaimer_dialog_title'.tr,
          description: [
            TextSpan(text: 'disclaimer_dialog_text_1'.tr),
            TextSpan(
              text: 'disclaimer_dialog_text_2'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: 'disclaimer_dialog_text_3'.tr),
          ],
          bottomWidgets: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ColorPalette.secondary,
                    side: const BorderSide(
                      color: ColorPalette.secondary,
                      width: 2,
                    ),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    'understood'.tr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  await showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.35),
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(
      scale: Tween<double>(
        begin: 0.5,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
      )),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
        )),
        child: alertDialog,
      ),
    ),
  );
}

Future<void> showPermissionDialog({
  required BuildContext context,
  required void Function()? onPressed,
}) async {
  final alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    contentPadding: EdgeInsets.zero,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InfoCard(
          icon: '⚙️',
          title: 'permission_dialog_title'.tr,
          description: [
            TextSpan(text: 'permission_dialog_text'.tr),
          ],
          bottomWidgets: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ColorPalette.secondary,
                    side: const BorderSide(
                      color: ColorPalette.secondary,
                      width: 2,
                    ),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    'open_settings'.tr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  await showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.35),
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(
      scale: Tween<double>(
        begin: 0.5,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
      )),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
        )),
        child: alertDialog,
      ),
    ),
  );
}

Future<void> showSnackbar({
  required String icon,
  required String title,
  required String description,
  int durationSeconds = 3,
}) async {
  final duration = Duration(seconds: durationSeconds);
  // Show the snackbar
  Get.snackbar(
    '',
    '',
    titleText: Text(
      title,
      style: const TextStyle(
        color: ColorPalette.onBackground,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    messageText: Text(
      description,
      style: const TextStyle(color: ColorPalette.onBackground, fontSize: 16),
    ),
    backgroundColor: ColorPalette.background.withOpacity(0.75),
    borderColor: ColorPalette.border.withOpacity(0.75),
    borderRadius: 15,
    borderWidth: 3,
    icon: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(icon, style: const TextStyle(fontSize: 24)),
    ),
    snackPosition: SnackPosition.BOTTOM,
    duration: duration,
  );
  // Wait for the snackbar to finish showing
  await Future.delayed(duration);
}

Future<void> showTimeSchedulerDialog({
  required BuildContext context,
  required void Function(TimeOfDay)? onTimeSelected,
}) async {
  int selectedHour = TimeOfDay.now().hour;
  int selectedMinute = TimeOfDay.now().minute;

  final alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    contentPadding: EdgeInsets.zero,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InfoCard(
          icon: '⏰',
          title: 'schedule_daily_reminder'.tr,
          description: null,
          bottomWidgets: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Hours
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'hour'.tr,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorPalette.border,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 60,
                              height: 100,
                              child: ListWheelScrollView.useDelegate(
                                itemExtent: 40,
                                perspective: 0.005,
                                diameterRatio: 1.2,
                                physics: const FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    selectedHour = index;
                                  });
                                },
                                controller: FixedExtentScrollController(
                                  initialItem: selectedHour,
                                ),
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: 24,
                                  builder: (context, index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: selectedHour == index
                                            ? ColorPalette.secondary
                                                .withOpacity(0.2)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        index.toString().padLeft(2, '0'),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: selectedHour == index
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: selectedHour == index
                                              ? ColorPalette.secondary
                                              : ColorPalette.onBackground,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Center colon with proper vertical alignment
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Text(
                              ':',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        // Minutes
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'minute'.tr,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorPalette.border,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 60,
                              height: 100,
                              child: ListWheelScrollView.useDelegate(
                                itemExtent: 40,
                                perspective: 0.005,
                                diameterRatio: 1.2,
                                physics: const FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    selectedMinute = index;
                                  });
                                },
                                controller: FixedExtentScrollController(
                                  initialItem: selectedMinute,
                                ),
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: 60,
                                  builder: (context, index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: selectedMinute == index
                                            ? ColorPalette.secondary
                                                .withOpacity(0.2)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        index.toString().padLeft(2, '0'),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: selectedMinute == index
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: selectedMinute == index
                                              ? ColorPalette.secondary
                                              : ColorPalette.onBackground,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorPalette.onBackground,
                      side: const BorderSide(
                        color: ColorPalette.onBackground,
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'cancel'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorPalette.onBackground,
                      side: const BorderSide(
                        color: ColorPalette.onBackground,
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      if (onTimeSelected != null) {
                        onTimeSelected(
                          TimeOfDay(hour: selectedHour, minute: selectedMinute),
                        );
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'confirm'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  await showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.35),
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(
      scale: Tween<double>(
        begin: 0.5,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
      )),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
        )),
        child: alertDialog,
      ),
    ),
  );
}

Future<void> showScheduledNotificationDialog({
  required BuildContext context,
}) async {
  final notificationService = NotificationService();
  final alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    contentPadding: EdgeInsets.zero,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InfoCard(
          icon: '🔔',
          title: 'scheduled_notifications'.tr,
          description: null,
          bottomWidgets: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FutureBuilder<List<PendingNotificationRequest>>(
                  future: notificationService.getPendingNotifications(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'error_loading_notifications'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            color: ColorPalette.border,
                          ),
                        ),
                      );
                    }

                    final notifications = snapshot.data ?? [];

                    if (notifications.isEmpty) {
                      return Center(
                        child: Text(
                          'no_scheduled_notifications'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            color: ColorPalette.border,
                          ),
                        ),
                      );
                    }

                    return FutureBuilder<Map<int, TimeOfDay>>(
                      future: notificationService.getAllNotificationTimes(),
                      builder: (context, timeSnapshot) {
                        final notificationTimes = timeSnapshot.data ?? {};

                        // Create a sorted list of notifications based on their time
                        final sortedNotifications =
                            List<PendingNotificationRequest>.from(
                                notifications);
                        sortedNotifications.sort((a, b) {
                          final timeA = notificationTimes[a.id];
                          final timeB = notificationTimes[b.id];

                          if (timeA == null || timeB == null) {
                            return 0;
                          }

                          // Compare hours first
                          if (timeA.hour != timeB.hour) {
                            return timeA.hour.compareTo(timeB.hour);
                          }

                          // If hours are the same, compare minutes
                          return timeA.minute.compareTo(timeB.minute);
                        });

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Scrollbar(
                                thickness: 5,
                                radius: const Radius.circular(10),
                                thumbVisibility: true,
                                trackVisibility: true,
                                interactive: true,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ListView.builder(
                                    itemCount: sortedNotifications.length,
                                    padding: EdgeInsets.zero,
                                    itemExtent:
                                        50, // Fixed height for each item
                                    itemBuilder: (context, index) {
                                      final notification =
                                          sortedNotifications[index];
                                      final time =
                                          notificationTimes[notification.id];

                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.access_time_rounded,
                                                  color: ColorPalette.border,
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  '${time?.hour.toString().padLeft(2, '0')}:${time?.minute.toString().padLeft(2, '0')}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: ColorPalette.border,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              constraints:
                                                  const BoxConstraints(),
                                              padding: EdgeInsets.zero,
                                              visualDensity:
                                                  VisualDensity.compact,
                                              icon: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                              onPressed: () async {
                                                await notificationService
                                                    .cancelNotification(
                                                        notification.id);
                                                if (context.mounted) {
                                                  Navigator.of(context).pop();
                                                  showScheduledNotificationDialog(
                                                      context: context);
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      await notificationService.cancelAllNotifications();
                      if (context.mounted) {
                        Navigator.of(context).pop();
                        showScheduledNotificationDialog(context: context);
                      }
                    },
                    child: Text(
                      'cancel_all'.tr,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorPalette.onBackground,
                      side: const BorderSide(
                        color: ColorPalette.onBackground,
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'cancel'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorPalette.onBackground,
                      side: const BorderSide(
                        color: ColorPalette.onBackground,
                        width: 2,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await showTimeSchedulerDialog(
                        context: context,
                        onTimeSelected: (selectedTime) async {
                          // Get the next notification ID
                          final id =
                              await notificationService.getNextNotificationId();

                          // Set the scheduled notification
                          await notificationService.scheduleNotification(
                            id: id,
                            title: 'scheduled_notification_title'.tr,
                            body: 'scheduled_notification_description'.tr,
                            hour: selectedTime.hour,
                            minute: selectedTime.minute,
                          );
                          // Show snackbar
                          await showSnackbar(
                            icon: '✅',
                            title: 'notification_successfully_set'.tr,
                            description:
                                '${'notification_successfully_set_description'.tr}${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}',
                          );
                        },
                      );
                    },
                    child: Text(
                      'new'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  await showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.35),
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(
      scale: Tween<double>(
        begin: 0.5,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
      )),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
        )),
        child: alertDialog,
      ),
    ),
  );
}

Future<void> showLanguageSelectorDialog({
  required BuildContext context,
  required String currentLocale,
}) async {
  final prefs = await SharedPreferences.getInstance();
  String selectedLanguage = prefs.getString('locale') ??
      currentLocale; // Initialize with current language
  final alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    contentPadding: EdgeInsets.zero,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InfoCard(
          icon: '🌐',
          title: 'select_language'.tr,
          description: null,
          bottomWidgets: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Scrollbar(
                            thickness: 5,
                            radius: const Radius.circular(10),
                            thumbVisibility: true,
                            trackVisibility: true,
                            interactive: true,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ListView.builder(
                                itemCount: languages.length,
                                padding: EdgeInsets.zero,
                                itemExtent: 50, // Fixed height for each item
                                itemBuilder: (context, index) {
                                  String languageKey =
                                      languages.keys.elementAt(index);
                                  String languageValue =
                                      languages.values.elementAt(index);

                                  return ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    onTap: () {
                                      setState(() {
                                        selectedLanguage = languageKey;
                                      });
                                    },
                                    title: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            languageValue,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: ColorPalette.border,
                                            ),
                                          ),
                                          if (selectedLanguage == languageKey)
                                            const Icon(
                                              Icons.done,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorPalette.onBackground,
                      side: const BorderSide(
                        color: ColorPalette.onBackground,
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'cancel'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorPalette.onBackground,
                      side: const BorderSide(
                        color: ColorPalette.onBackground,
                        width: 2,
                      ),
                    ),
                    onPressed: () async {
                      // Create the new locale based on the selected language
                      var locale = Locale(selectedLanguage);
                      // Update the app's locale
                      await Get.updateLocale(locale);
                      // Save the selected language to shared preferences
                      await prefs.setString('locale', locale.languageCode);
                      // Pop the dialog
                      if (context.mounted) Navigator.of(context).pop();
                      // Show snackbar
                      await showSnackbar(
                        icon: '✅',
                        title: 'language_changed'.tr,
                        description:
                            '${'language_changed_description'.tr}${languages[selectedLanguage]}',
                      );
                    },
                    child: Text(
                      'apply'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  if (context.mounted) {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.35),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(
        scale: Tween<double>(
          begin: 0.5,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        )),
        child: FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeIn,
          )),
          child: alertDialog,
        ),
      ),
    );
  }
}
