import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/recommendations/presentation/view/widgets/featured_exercise_card.dart';
import 'package:fitness_app/feature/recommendations/presentation/view/widgets/most_popular_exercise_item.dart';
import 'package:fitness_app/feature/recommendations/presentation/view/exercise_detail_screen.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});
  final List<Map<String, String>> mostPopularExercises = const [
    {
      'imagePath': 'assets/images/woman-helping-man-gym (1) 2 (1).png',
      'title': 'Squat Exercise',
      'duration': '12 Minutes',
      'calories': '120 Kcal',
      'difficulty': 'Medium',
      'detailImage': 'assets/images/woman-helping-man-gym (1) 2 (1).png', // Add a specific detail image
    },
    {
      'imagePath': 'assets/images/woman-helping-man-gym (1) 3 (1).png',
      'title': 'Full Body Stretching',
      'duration': '12 Minutes',
      'calories': '120 Kcal',
      'difficulty': 'Easy',
      'detailImage': 'assets/images/woman-helping-man-gym (1) 3 (1).png', // Add a specific detail image
    },
    {
      'imagePath': 'assets/images/woman-helping-man-gym (1) 5.png',
      'title': 'Dumbbell Step Up',
      'duration': '15 Minutes',
      'calories': '150 Kcal',
      'difficulty': 'Hard',
      'detailImage': 'assets/images/woman-helping-man-gym (1) 5.png', // Add a specific detail image
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding:AppPadding.pageHorizontal,
                child: _buildAppBar(context),
              ),
              const SizedBox(height: 20),

              // Featured Exercise Card
              FeaturedExerciseCard(
                imagePath: 'assets/images/woman-helping-man-gym 1.png',
                title: 'Dumbbell Step Up',
                duration: '12 Minutes',
                calories: '120 Kcal',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExerciseDetailScreen(
                      title: 'Dumbbell Step Up',
                      difficulty: 'Medium',
                      imagePath: 'assets/images/dumbbell_step_up_video.png',
                    )),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Most Popular Section
              Padding(
                padding: AppPadding.pageHorizontal,
                child: TitleText(
                  text: 'Most Popular',
                  color: AppColors.yellow,
                  fontSize: 20,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10),
              _buildMostPopularList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_left, color: AppColors.yellow, size: 25),
        ),
        const ScreenTitleText(
          text: 'Recommendations',
          color: AppColors.purple,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildMostPopularList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Outer padding
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75, // Adjust to control item height
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(mostPopularExercises.length, (index) {
          final exercise = mostPopularExercises[index];
          return MostPopularExerciseItem(
            imagePath: exercise['imagePath']!,
            title: exercise['title']!,
            duration: exercise['duration']!,
            calories: exercise['calories']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseDetailScreen(
                    title: exercise['title']!,
                    difficulty: exercise['difficulty']!,
                    imagePath: exercise['detailImage']!,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }


}