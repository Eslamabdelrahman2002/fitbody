import 'package:fitness_app/feature/setting/presentation/view/widgets/notification_toggle_row.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool generalNotification = true;
  bool sound = true;
  bool donotDisturbMode = false;
  bool vibrate = true;
  bool lockScreen = true;
  bool reminders = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageHorizontal,
          child: Column(
            children: [
              const SizedBox(height: 10),
              // App Bar
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const FaIcon(
                      Icons.arrow_left_outlined,
                      color: AppColors.yellow,
                      size: 27,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const ScreenTitleText(
                    text: 'Notifications Settings',
                    color: AppColors.purple,
                    textAlign: TextAlign.left, // Adjust alignment for app bar title
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Notification Toggles
              NotificationToggleRow(
                text: 'General Notification',
                value: generalNotification,
                onChanged: (bool newValue) {
                  setState(() {
                    generalNotification = newValue;
                  });
                },
              ),
              NotificationToggleRow(
                text: 'Sound',
                value: sound,
                onChanged: (bool newValue) {
                  setState(() {
                    sound = newValue;
                  });
                },
              ),
              NotificationToggleRow(
                text: 'Don\'t Disturb Mode',
                value: donotDisturbMode,
                onChanged: (bool newValue) {
                  setState(() {
                    donotDisturbMode = newValue;
                  });
                },
              ),
              NotificationToggleRow(
                text: 'Vibrate',
                value: vibrate,
                onChanged: (bool newValue) {
                  setState(() {
                    vibrate = newValue;
                  });
                },
              ),
              NotificationToggleRow(
                text: 'Lock Screen',
                value: lockScreen,
                onChanged: (bool newValue) {
                  setState(() {
                    lockScreen = newValue;
                  });
                },
              ),
              NotificationToggleRow(
                text: 'Reminders',
                value: reminders,
                onChanged: (bool newValue) {
                  setState(() {
                    reminders = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}