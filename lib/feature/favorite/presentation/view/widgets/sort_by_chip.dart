import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/core/costant/text.dart'; // Assuming ButtonText is here

class SortByChip extends StatelessWidget {
  final VoidCallback onTap;

  const SortByChip({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.purpleLight, // Background color of the chip
          borderRadius: BorderRadius.circular(AppRadius.skipButton), // Rounded corners
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.tune, color: AppColors.white, size: 18),
            SizedBox(width: 8),
            ButtonText(
              text: 'Sort By',
              color: AppColors.white,
              fontSize: 14, // Smaller font for the chip
            ),
          ],
        ),
      ),
    );
  }
}