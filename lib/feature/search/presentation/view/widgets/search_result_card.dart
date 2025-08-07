import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class SearchResultCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String type; // 'workout' or 'nutrition'
  final String? duration;
  final String? calories;
  final String? exercises; // Only for workouts

  const SearchResultCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.type,
    this.duration,
    this.calories,
    this.exercises,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purple, // Background color of the card
        borderRadius: BorderRadius.circular(AppRadius.contentBox),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.button),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  text: title,
                  color: AppColors.white,
                  fontSize: 18,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                if (duration != null)
                  Row(
                    children: [
                      Icon(Icons.access_time, color: AppColors.white, size: 14),
                      SizedBox(width: 5),
                      ParagraphText(
                        text: duration!,
                        color: AppColors.white,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.local_fire_department_outlined, color: AppColors.white, size: 14),
                      SizedBox(width: 5),
                      ParagraphText(
                        text: calories!,
                        color: AppColors.white,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                if (type == 'workout' && exercises != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: [
                        Icon(Icons.fitness_center, color: AppColors.white, size: 14),
                        SizedBox(width: 5),
                        ParagraphText(
                          text: exercises!,
                          color: AppColors.white,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // Star icon on the right, only for the "All Search" and "Workout Search" example in image
          if (type == 'workout') // Assuming star is only for workouts based on image
            Icon(Icons.star, color: AppColors.yellow, size: 24),
        ],
      ),
    );
  }
}