import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutExerciseTile extends StatelessWidget {
  final String exerciseTitle;
  final String duration;
  final String reps;
  final VoidCallback onTap;

  const WorkoutExerciseTile({
    Key? key,
    required this.exerciseTitle,
    required this.duration,
    required this.reps,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.contentBox),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.purpleLight,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.play_arrow, color: AppColors.white, size: 24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubtitleText(
                    text: exerciseTitle,
                    color: AppColors.black,
                    textAlign: TextAlign.left,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      FaIcon(Icons.timer,color: AppColors.purpleLight,size: 15,),
                      ParagraphText(text: duration, color: AppColors.purpleLight, fontSize: 12),
                    ],
                  ),
                ],
              ),
            ),
            ScreenTitleText(text: reps, color: AppColors.purpleLight, fontSize: 12),
          ],
        ),
      ),
    );
  }
}