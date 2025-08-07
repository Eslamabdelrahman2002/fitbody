import 'package:fitness_app/feature/setting/presentation/view/password_settings_screen.dart';
import 'package:fitness_app/feature/setting/presentation/view/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'notification_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                    text: 'Settings',
                    color: AppColors.purple,
                    textAlign: TextAlign.left, // Adjust alignment for app bar title
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Settings Options
              SettingsListTile(
                icon: Icons.notifications,
                text: 'Notification Setting',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationSettingsScreen()),
                  );
                },
              ),
              SettingsListTile(
                icon: Icons.lock_outline,
                text: 'Password Setting',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PasswordSettingsScreen()),
                  );
                },
              ),
              SettingsListTile(
                icon: Icons.person_off,
                text: 'Delete Account',
                onTap: () {
                  // Handle delete account logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}