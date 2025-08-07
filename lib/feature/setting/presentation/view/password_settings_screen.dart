import 'package:fitness_app/feature/setting/presentation/view/widgets/password_input_field.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordSettingsScreen extends StatefulWidget {
  const PasswordSettingsScreen({super.key});

  @override
  State<PasswordSettingsScreen> createState() => _PasswordSettingsScreenState();
}

class _PasswordSettingsScreenState extends State<PasswordSettingsScreen> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    // Implement password change logic here
    // You'll need to validate inputs (e.g., new password matches confirm password,
    // current password is correct).
    String currentPassword = _currentPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmNewPassword = _confirmNewPasswordController.text;

    if (newPassword != confirmNewPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New passwords do not match!')),
      );
      return;
    }

    // Example: Print values (replace with actual authentication/update)
    print('Current Password: $currentPassword');
    print('New Password: $newPassword');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password change attempt. (Logic not fully implemented)')),
    );
    // You would typically call an authentication service here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: 'Password Settings',
                    color: AppColors.purple,
                    textAlign: TextAlign.left, // Adjust alignment for app bar title
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Password Fields
              PasswordInputField(
                controller: _currentPasswordController,
                labelText: 'Current Password',
                isObscure: true,
                showForgotPassword: true,
                onForgotPasswordTap: () {
                  // Handle forgot password tap
                },
              ),
              const SizedBox(height: 20),
              PasswordInputField(
                controller: _newPasswordController,
                labelText: 'New Password',
                isObscure: true,
              ),
              const SizedBox(height: 20),
              PasswordInputField(
                controller: _confirmNewPasswordController,
                labelText: 'Confirm New Password',
                isObscure: true,
              ),
              const Spacer(), // Pushes the button to the bottom

              // Change Password Button
              Center(
                child: GestureDetector(
                  onTap: _changePassword,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: ButtonText(
                        text: 'Change Password',
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}