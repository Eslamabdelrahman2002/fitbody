// workout_videos_screen.dart
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/resources/presentation/view/widgets/workout_video_card.dart';
import 'package:fitness_app/feature/resources/presentation/view/workout_exercise_detail_screen.dart';

class WorkoutVideosScreen extends StatelessWidget {
  const WorkoutVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          text: 'Quick & Easy Workout Videos',
          color: AppColors.yellow,
          fontSize: 20,
          textAlign: TextAlign.left,
        ),
        ParagraphText(
          text: 'Discover fresh workouts, Elevate your training',
          color: AppColors.white.withOpacity(0.7),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20),
        Expanded(
           child: GridView.count( // Changed to GridView.count
             crossAxisCount: 2, // Two columns
             crossAxisSpacing: 5, // Spacing between columns
             mainAxisSpacing: 5, // Spacing between rows
             childAspectRatio: 0.8, // Adjust aspect ratio if needed
             children: [
              WorkoutVideoCard(
                imagePath: 'assets/images/woman-helping-man-gym (1) 3 (1).png',
                title: 'Loop Band Exercises',
                duration: '45 Minutes',
                exercises: '5 Exercises',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutExerciseDetailScreen()));
                },
              ),
              WorkoutVideoCard(
                imagePath: 'assets/images/woman-helping-man-gym (1) 4.png',
                title: 'Workouts For Beginners',
                duration: '45 Minutes',
                exercises: '5 Exercises',
                onTap: () {},
              ),
              WorkoutVideoCard(
                imagePath: 'assets/images/woman-helping-man-gym (1) 4 (1).png',
                title: 'Full Body Stretch',
                duration: '45 Minutes',
                exercises: '5 Exercises',
                onTap: () {},
              ),
              WorkoutVideoCard(
                imagePath: 'assets/images/woman-helping-man-gym (1) 5.png',
                title: 'Low Impact Workouts',
                duration: '45 Minutes',
                exercises: '5 Exercises',
                onTap: () {},
              ),
              WorkoutVideoCard(
                imagePath: 'assets/images/woman-helping-man-gym 1.png',
                title: 'Strength Training',
                duration: '45 Minutes',
                exercises: '5 Exercises',
                onTap: () {},
              ),
              WorkoutVideoCard(
                imagePath: 'assets/images/woman-helping-man-gym (1) 1.png',
                title: 'Split Squats Vs Lunges',
                duration: '45 Minutes',
                exercises: '5 Exercises',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}