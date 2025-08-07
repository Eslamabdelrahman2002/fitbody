import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';

class MealPlanChoiceChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const MealPlanChoiceChip({
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          // color: AppColors.purple,
          // borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.yellow : AppColors.white,
                  width: 2,
                ),
                color: isSelected ? AppColors.yellow : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.circle, color: AppColors.black, size: 8)
                  : null,
            ),
            const SizedBox(width: 10),
            ParagraphText(
              text: text,
              color: AppColors.white,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}