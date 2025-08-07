import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/feature/workout/presentation/view/widgets/workout_exercise_tile.dart';
import 'package:fitness_app/feature/workout/presentation/view/widgets/workout_video_player_screen.dart';
import 'package:fitness_app/feature/workout/presentation/view/widgets/workout_detail_info_card.dart';

import '../../../../profile/presentation/view/profile.dart';
import '../../../../search/presentation/view/search_screen.dart'; // Import the new widget

class WorkoutDetailScreen extends StatelessWidget {
  final String workoutTitle;
  final String workoutLevel;
  final String workoutDuration;
  final String workoutCalories;
  final String workoutExercises;
  final List<Map<String, dynamic>> rounds;

  const WorkoutDetailScreen({
    Key? key,
    required this.workoutTitle,
    required this.workoutLevel,
    required this.workoutDuration,
    required this.workoutCalories,
    required this.workoutExercises,
    required this.rounds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // App Bar
            Padding(
              padding: AppPadding.pageHorizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_left_outlined,
                      color: AppColors.yellow,
                      size: 25,
                    ),
                  ),
                  ScreenTitleText(
                    text: workoutLevel,
                    color: AppColors.purple,
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                      }, icon: Icon(Icons.search,color: AppColors.purple,)),
                      SizedBox(width: 15),
                      IconButton(onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
                      },icon: Icon(Icons.person,color: AppColors.purple,),) // Using person icon as a placeholder for the rightmost icon
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Workout Info Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.purpleLight, // The light purple background
              ),
              padding: const EdgeInsets.all(25), // Padding to create the border effect
              child: WorkoutDetailInfoCard(
                imagePath: 'assets/images/woman-helping-man-gym (1) 1.png', // You'll need to add this image
                workoutTitle: workoutTitle,
                workoutLevel: workoutLevel,
                workoutDuration: workoutDuration,
                workoutCalories: workoutCalories,
                onTap: () {
                  // This onTap is for the card itself, not the video player
                },
              ),
            ),
            const SizedBox(height: 20),

            // Exercises List
            Expanded(
              child: ListView.builder(
                itemCount: rounds.length,
                itemBuilder: (context, roundIndex) {
                  final round = rounds[roundIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: round['title'],
                        color: AppColors.white,
                        fontSize: 20,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      ...round['exercises'].map<Widget>((exercise) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: WorkoutExerciseTile(
                            exerciseTitle: exercise['name'],
                            duration: exercise['duration'],
                            reps: exercise['reps'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WorkoutVideoPlayerScreen(
                                    exerciseTitle: exercise['name'],
                                    difficulty: workoutLevel,
                                    duration: exercise['duration'],
                                    reps: exercise['reps'],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}