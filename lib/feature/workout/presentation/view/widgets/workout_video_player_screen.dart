import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class WorkoutVideoPlayerScreen extends StatelessWidget {
  final String exerciseTitle;
  final String difficulty;
  final String duration;
  final String reps;

  const WorkoutVideoPlayerScreen({
    Key? key,
    required this.exerciseTitle,
    required this.difficulty,
    required this.duration,
    required this.reps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                // Placeholder for the video player
                Image.asset(
                  'assets/images/woman-helping-man-gym 4.png', // Placeholder image
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: AppColors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Center(
                  heightFactor: 3,
                  child: Icon(
                    Icons.play_circle_fill,
                    color: AppColors.purpleLight,
                    size: 80,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: AppPadding.pageHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(AppRadius.contentBox),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitleText(
                          text: exerciseTitle,
                          color: AppColors.black,
                          fontSize: 20,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        ParagraphText(
                          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed cursus libero eget.',
                          color: AppColors.black.withOpacity(0.8),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding:EdgeInsets.all(8),
                          decoration:BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(25)
                            
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.access_time, color: AppColors.black, size: 14),
                                SizedBox(width: 5),
                                ParagraphText(text: duration, color: AppColors.black, fontSize: 12),
                                SizedBox(width: 10),
                                Icon(Icons.repeat, color: AppColors.black, size: 14),
                                SizedBox(width: 5),
                                ParagraphText(text: reps, color: AppColors.black, fontSize: 12),
                                SizedBox(width: 10),
                                Icon(Icons.star, color: AppColors.black, size: 14),
                                SizedBox(width: 5),
                                ParagraphText(text: difficulty, color: AppColors.black, fontSize: 12),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}