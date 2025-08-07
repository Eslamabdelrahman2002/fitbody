import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class ChallengeExerciseTile extends StatelessWidget {
  final String title;
  final String duration;
  final String reps;
  final VoidCallback onTap;

  const ChallengeExerciseTile({
    Key? key,
    required this.title,
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
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(50),
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
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubtitleText(
                        text: title,
                        color: AppColors.black,
                        textAlign: TextAlign.left,
                        fontSize: 16,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.timer,color: AppColors.purpleLight,size: 15,),
                          ParagraphText(text: duration, color: AppColors.purpleLight, fontSize: 12),

                        ],
                      ),
                    ],
                  ),
                   Spacer(),
                   ParagraphText(text: reps, color: AppColors.purpleLight, fontSize: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}