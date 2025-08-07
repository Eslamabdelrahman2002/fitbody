import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/core/costant/text.dart';

class NotificationTabButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const NotificationTabButton({
    Key? key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.yellow : AppColors.white, // Yellow if selected, purpleLight otherwise
          borderRadius: text == 'Reminders'
              ? BorderRadius.horizontal(left: Radius.circular(50),right: Radius.circular(50)) // Rounded left for Reminders
              : BorderRadius.horizontal(right: Radius.circular(50),left: Radius.circular(50)), // Rounded right for System
        ),
        child: Center(
          child: ButtonText(
            text: text,
            color: isSelected ? AppColors.black : AppColors.purpleLight, // Black text if selected, white otherwise
            fontSize: 16, // Adjust font size for the tab text
          ),
        ),
      ),
    );
  }
}