import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/core/costant/text.dart';

class MealPlanTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const MealPlanTab({
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.yellow : AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        child: Center(
          child: ButtonText(
            text: text,
            color: isSelected ? AppColors.black : AppColors.purpleLight,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}