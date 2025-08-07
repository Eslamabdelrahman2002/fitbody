import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/community/presentation/view/widgets/exercise_tile.dart';
import 'package:fitness_app/feature/community/presentation/view/challenge_video_screen.dart';

import '../../../../core/costant/app_radius.dart';

class ChallengeExercisesScreen extends StatelessWidget {
  const ChallengeExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildAppBar(context),
            const SizedBox(height: 20),
            _buildChallengeInfo(),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: AppPadding.pageHorizontal,
                child: ListView(
                  children: [
                    _buildRoundSection(context, 'Round 1', [
                      {'name': 'Endurance Ride', 'duration': '00:30', 'difficulty': 'Moderate'},
                      {'name': 'Hill Climbs', 'duration': '01:00', 'difficulty': 'High'},
                      {'name': 'Interval Sprints', 'duration': '01:30', 'difficulty': 'High'},
                      {'name': 'Tempo Ride', 'duration': '02:00', 'difficulty': 'Moderate'},
                      {'name': 'Cadence Drill', 'duration': '02:30', 'difficulty': 'Moderate'},
                    ]),
                    _buildRoundSection(context, 'Round 2', [
                      {'name': 'Endurance Ride', 'duration': '00:30', 'difficulty': 'Moderate'},
                      {'name': 'Hill Climbs', 'duration': '01:00', 'difficulty': 'High'},
                      {'name': 'Interval Sprints', 'duration': '01:30', 'difficulty': 'High'},
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_left, color: AppColors.yellow, size: 25),
        ),
        const ScreenTitleText(
          text: 'Weekly Challenge',
          color: AppColors.purple,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildChallengeInfo() {
    return  Stack(
      children: [
        Container(
          color: AppColors.purpleLight,
          width: double.infinity,
          height: 250,
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            height: 200,
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
                    'assets/images/woman-helping-man-gym (1) 1 (2).png',
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
                        text: 'Cycling Challenge',
                        color: AppColors.yellow,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: AppColors.yellow, size: 14),
                          SizedBox(width: 5),
                          ParagraphText(text: '45 Minutes', color: AppColors.white, fontSize: 12),
                          SizedBox(width: 10),
                          Icon(Icons.local_fire_department_outlined, color: AppColors.yellow, size: 14),
                          SizedBox(width: 5),
                          ParagraphText(text:'70 Kcal', color: AppColors.white, fontSize: 12),
                          SizedBox(width: 10),
                          Icon(Icons.directions_run_outlined, color: AppColors.yellow, size: 14),
                          SizedBox(width: 5),
                          ParagraphText(text:'5 exercises', color: AppColors.white, fontSize: 12),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoundSection(BuildContext context, String title, List<Map<String, String>> exercises) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        TitleText(
          text: title,
          color: AppColors.white,
          fontSize: 20,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 10),
        ...exercises.map((exercise) {
          return ExerciseTile(
            title: exercise['name']!,
            duration: exercise['duration']!,
            reps: exercise['reps'] ?? '',
            difficulty: exercise['difficulty']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChallengeVideoScreen(
                    exerciseTitle: exercise['name']!,
                    duration: exercise['duration']!,
                    difficulty: exercise['difficulty']!,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ],
    );
  }
}