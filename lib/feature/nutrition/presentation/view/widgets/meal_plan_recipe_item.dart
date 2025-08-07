import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class MealPlanRecipeItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final VoidCallback onTap;

  const MealPlanRecipeItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.contentBox),
        ),
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubtitleText(
                    text: title,
                    color: AppColors.black,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: AppColors.black, size: 14),
                      SizedBox(width: 5),
                      ParagraphText(text: duration, color: AppColors.black, fontSize: 12, textAlign: TextAlign.left),
                      SizedBox(width: 10),
                      Icon(Icons.local_fire_department_outlined, color: AppColors.black, size: 14),
                      SizedBox(width: 5),
                      ParagraphText(text: calories, color: AppColors.black, fontSize: 12, textAlign: TextAlign.left),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.button),
                  child: Image.asset(
                    imagePath,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () { /* Handle favorite toggle */ },
                    child: Icon(
                      Icons.star,
                      color: AppColors.white, // White star as default
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}