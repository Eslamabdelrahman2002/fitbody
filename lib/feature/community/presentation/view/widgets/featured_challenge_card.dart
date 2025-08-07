import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class FeaturedChallengeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final VoidCallback onTap;

  const FeaturedChallengeCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.purpleLight,
          width: double.infinity,
          height: 400,
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(AppRadius.contentBox),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.contentBox),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.contentBox),
                        gradient: LinearGradient(
                          colors: [AppColors.black.withOpacity(0.8), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 15,
                    bottom: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubtitleText(
                          text: title,
                          color: AppColors.yellow,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: AppColors.yellow, size: 14),
                            SizedBox(width: 5),
                            ParagraphText(text: duration, color: AppColors.white, fontSize: 12),
                            SizedBox(width: 10),
                            Icon(Icons.local_fire_department_outlined, color: AppColors.yellow, size: 14),
                            SizedBox(width: 5),
                            ParagraphText(text: calories, color: AppColors.white, fontSize: 12),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}