import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/weekly_challenge/presentation/view/widgets/featured_exercise_card.dart';
import 'package:fitness_app/feature/weekly_challenge/presentation/view/widgets/challenge_exercise_tile.dart';
import 'package:fitness_app/feature/weekly_challenge/presentation/view/weekly_challenge_video_screen.dart';

class WeeklyChallengeScreen extends StatelessWidget {
  const WeeklyChallengeScreen({super.key});

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

            // Featured Exercise Card
            FeaturedExerciseCard(
              imagePath: 'assets/images/woman-working-out-gym-2 1.png',
              title: 'Pull Out',
              duration: '10 Minutes',
              calories: '120 Kcal',
              level: 'Beginner',
              onTap: () {},
            ),
            const SizedBox(height: 20),

            // Exercise List by Rounds
            Expanded(
              child: ListView(
                children: [
                  _buildRoundSection(context, 'Round 1', [
                    {'name': 'Pull Out', 'duration': '00:30', 'reps': 'Repetition 3x'},
                    {'name': 'Jumping Pull-Ups', 'duration': '00:15', 'reps': 'Repetition 2x'},
                    {'name': 'Negative Pull-Up', 'duration': '00:30', 'reps': 'Repetition 2x'},
                  ]),
                  const SizedBox(height: 20),
                  _buildRoundSection(context, 'Round 2', [
                    {'name': 'Pull Out/Push-Ups', 'duration': '00:30', 'reps': 'Repetition 2x'},
                    {'name': 'Pull Out/Push-Ups', 'duration': '00:30', 'reps': 'Repetition 4x'},
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding:AppPadding.pageHorizontal,
      child: Row(
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
      ),
    );
  }

  Widget _buildRoundSection(BuildContext context, String title, List<Map<String, String>> exercises) {
    return Padding(
      padding: AppPadding.pageHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            text: title,
            color: AppColors.yellow,
            fontSize: 20,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          ...exercises.map((exercise) {
            return ChallengeExerciseTile(
              title: exercise['name']!,
              duration: exercise['duration']!,
              reps: exercise['reps']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeeklyChallengeVideoScreen(
                      exerciseTitle: exercise['name']!,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}