import 'package:fitness_app/feature/resources/presentation/view/widgets/workout_video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class WorkoutExerciseDetailScreen extends StatelessWidget {
  final String? title;
  final String? difficulty;
  final String? duration;

  const WorkoutExerciseDetailScreen({
    Key? key,
    this.title,
    this.difficulty,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section with image and details
              _buildHeader(context),

              // Workout Rounds section
              Padding(
                padding: AppPadding.pageHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    TitleText(
                      text: 'Round 1',
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                    const SizedBox(height: 10),
                    _buildExerciseCard(
                      context,
                      title: 'Arm Circles',
                      duration: '00:30',
                      reps: 'Repetition 3x',
                      difficulty: 'Beginner', // Added difficulty
                      onTap: () {
                        // Navigate to video player screen with exercise details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WorkoutVideoPlayerScreen(
                              exerciseTitle: 'Arm Circles',
                              duration: '00:30',
                              reps: 'Repetition 3x',
                              difficulty: 'Beginner',
                            ),
                          ),
                        );
                      },
                    ),
                    _buildExerciseCard(
                      context,
                      title: 'Bicep Curls',
                      duration: '00:15',
                      reps: 'Repetition 2x',
                      difficulty: 'Beginner', // Added difficulty
                      onTap: () {
                        // Navigate to video player screen with exercise details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WorkoutVideoPlayerScreen(
                              exerciseTitle: 'Bicep Curls',
                              duration: '00:15',
                              reps: 'Repetition 2x',
                              difficulty: 'Beginner',
                            ),
                          ),
                        );
                      },
                    ),
                    _buildExerciseCard(
                      context,
                      title: 'Lateral Band Walks',
                      duration: '00:10',
                      reps: 'Repetition 2x',
                      difficulty: 'Intermediate', // Added difficulty
                      onTap: () {
                        // Navigate to video player screen with exercise details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WorkoutVideoPlayerScreen(
                              exerciseTitle: 'Lateral Band Walks',
                              duration: '00:10',
                              reps: 'Repetition 2x',
                              difficulty: 'Intermediate',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    TitleText(
                      text: 'Round 2',
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                    const SizedBox(height: 10),
                    _buildExerciseCard(
                      context,
                      title: 'Tricep Extensions',
                      duration: '00:10',
                      reps: 'Repetition 2x',
                      difficulty: 'Intermediate', // Added difficulty
                      onTap: () {
                        // Navigate to video player screen with exercise details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WorkoutVideoPlayerScreen(
                              exerciseTitle: 'Tricep Extensions',
                              duration: '00:10',
                              reps: 'Repetition 2x',
                              difficulty: 'Intermediate',
                            ),
                          ),
                        );
                      },
                    ),
                    _buildExerciseCard(
                      context,
                      title: 'Squats With Band',
                      duration: '00:10',
                      reps: 'Repetition 4x',
                      difficulty: 'Advanced', // Added difficulty
                      onTap: () {
                        // Navigate to video player screen with exercise details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WorkoutVideoPlayerScreen(
                              exerciseTitle: 'Squats With Band',
                              duration: '00:10',
                              reps: 'Repetition 4x',
                              difficulty: 'Advanced',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 450,
          width: double.infinity,
          color: AppColors.purpleLight,),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Stack(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(AppRadius.contentBox),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.contentBox),
                  child: Image.asset(
                    'assets/images/woman-helping-man-gym (1) 2 (1).png', // استخدم صورة مناسبة
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppRadius.contentBox),
                      bottomRight: Radius.circular(AppRadius.contentBox),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: 'Loop Band Exercises',
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: AppColors.white, size: 14),
                          SizedBox(width: 5),
                          ParagraphText(
                            text: '45 Minutes',
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.local_fire_department, color: AppColors.white, size: 14),
                          SizedBox(width: 5),
                          ParagraphText(
                            text: '70 Kcal',
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.fitness_center, color: AppColors.white, size: 14),
                          SizedBox(width: 5),
                          ParagraphText(
                            text: '5 Exercises',
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseCard(BuildContext context, {required String title, required String duration, required String reps, required String difficulty, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.contentBox),
        ),
        child: Row(
          children: [
            Icon(Icons.play_circle_fill, color: AppColors.purpleLight, size: 30),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubtitleText(
                    text: title,
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: AppColors.purple, size: 12),
                      const SizedBox(width: 5),
                      ParagraphText(
                        text: duration,
                        color: AppColors.purple.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SubtitleText(
              text: reps,
              color: AppColors.purple,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}