import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class ExerciseTile extends StatelessWidget {
  final String title;
  final String duration;
  final String reps;
  final String difficulty;
  final VoidCallback onTap;

  const ExerciseTile({
    Key? key,
    required this.title,
    required this.duration,
    required this.reps,
    required this.difficulty,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(AppRadius.contentBox),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.play_arrow, color: AppColors.black, size: 24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubtitleText(
                    text: title,
                    color: AppColors.white,
                    textAlign: TextAlign.left,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      ParagraphText(text: duration, color: AppColors.white, fontSize: 12),
                      SizedBox(width: 10),
                      ParagraphText(text: reps, color: AppColors.white, fontSize: 12),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.purpleLight,
                borderRadius: BorderRadius.circular(AppRadius.skipButton),
              ),
              child: ParagraphText(
                text: difficulty,
                color: AppColors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}