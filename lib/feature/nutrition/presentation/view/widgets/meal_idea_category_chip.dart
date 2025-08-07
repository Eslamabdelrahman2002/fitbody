import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/core/costant/text.dart';

class MealIdeaCategoryChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const MealIdeaCategoryChip({
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
          color: isSelected ? AppColors.yellow : AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        child: Center(
          child: ButtonText(
            text: text,
            color: isSelected ? AppColors.black : AppColors.purple,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}