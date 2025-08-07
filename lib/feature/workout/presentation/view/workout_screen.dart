import 'package:fitness_app/feature/workout/presentation/view/widgets/workout_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/workout/presentation/view/widgets/workout_level_tab.dart';
import 'package:fitness_app/feature/workout/presentation/view/widgets/workout_of_day_card.dart';
import 'package:fitness_app/feature/workout/presentation/view/widgets/workout_list_item.dart';

import '../../../profile/presentation/view/profile.dart';
import '../../../search/presentation/view/search_screen.dart';
class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  String selectedLevel = 'Beginner'; // State for selected tab

  // Sample data for each workout level
  final Map<String, dynamic> beginnerData = {
    'trainingOfTheDay': {
      'imagePath': 'assets/images/woman-helping-man-gym (1) 1.png',
      'title': 'Functional Training',
      'duration': '45 Minutes',
      'calories': '1450 Kcal',
      'exercises': '5 Exercises',
      'level': 'Beginner',
    },
    'otherWorkoutsTitle': 'Let\'s Go Beginner',
    'otherWorkouts': [
      {'imagePath': 'assets/images/woman-helping-man-gym 1.png', 'title': 'Upper Body', 'duration': '60 Minutes', 'calories': '1120 Kcal', 'exercises': '5 Exercises', 'level': 'Beginner'},
      {'imagePath': 'assets/images/woman-helping-man-gym 2.png', 'title': 'Full Body Stretching', 'duration': '45 Minutes', 'calories': '1450 Kcal', 'exercises': '5 Exercises', 'level': 'Beginner'},
      {'imagePath': 'assets/images/woman-helping-man-gym 3.png', 'title': 'Glutes & Abs', 'duration': '60 Minutes', 'calories': '1120 Kcal', 'exercises': '5 Exercises', 'level': 'Beginner'},
    ],
  };

  final Map<String, dynamic> intermediateData = {
    'trainingOfTheDay': {
      'imagePath': 'assets/images/woman-helping-man-gym (1) 1.png',
      'title': 'Cardio Fitness',
      'duration': '45 Minutes',
      'calories': '1120 Kcal',
      'exercises': '5 Exercises',
      'level': 'Intermediate',
    },
    'otherWorkoutsTitle': 'Keep Raising Your Level',
    'otherWorkouts': [
      {'imagePath': 'assets/images/woman-helping-man-gym 2.png', 'title': 'Circuit Training', 'duration': '60 Minutes', 'calories': '1300 Kcal', 'exercises': '5 Exercises', 'level': 'Intermediate'},
      {'imagePath': 'assets/images/woman-helping-man-gym 3.png', 'title': 'Split Strength Training', 'duration': '12 Minutes', 'calories': '1250 Kcal', 'exercises': '5 Exercises', 'level': 'Intermediate'},
      {'imagePath': 'assets/images/woman-helping-man-gym 4.png', 'title': 'Resistance Bands', 'duration': '45 Minutes', 'calories': '1450 Kcal', 'exercises': '5 Exercises', 'level': 'Intermediate'},
    ],
  };

  final Map<String, dynamic> advancedData = {
    'trainingOfTheDay': {
      'imagePath': 'assets/images/woman-helping-man-gym (1) 1.png',
      'title': 'Upper Body Strength',
      'duration': '60 Minutes',
      'calories': '1450 Kcal',
      'exercises': '5 Exercises',
      'level': 'Advanced',
    },
    'otherWorkoutsTitle': 'Unlock Your Potential',
    'otherWorkouts': [
      {'imagePath': 'assets/images/woman-helping-man-gym 1.png', 'title': 'Cardio Boxing', 'duration': '50 Minutes', 'calories': '1100 Kcal', 'exercises': '5 Exercises', 'level': 'Advanced'},
      {'imagePath': 'assets/images/woman-helping-man-gym 2.png', 'title': 'Hypertrophy - Legs', 'duration': '12 Minutes', 'calories': '1250 Kcal', 'exercises': '5 Exercises', 'level': 'Advanced'},
      {'imagePath': 'assets/images/woman-helping-man-gym 3.png', 'title': 'Rest Or Active', 'duration': '60 Minutes', 'calories': '1450 Kcal', 'exercises': '5 Exercises', 'level': 'Advanced'},
    ],
  };

  Map<String, dynamic> get currentWorkoutData {
    if (selectedLevel == 'Intermediate') {
      return intermediateData;
    } else if (selectedLevel == 'Advanced') {
      return advancedData;
    } else {
      return beginnerData;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = currentWorkoutData;

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
              const ScreenTitleText(
                text: 'Workout',
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

        // Level Tabs
        Padding(
          padding: AppPadding.pageHorizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WorkoutLevelTab(
                text: 'Beginner',
                isSelected: selectedLevel == 'Beginner',
                onTap: () => setState(() => selectedLevel = 'Beginner'),
              ),
              SizedBox(width: 15,),
              WorkoutLevelTab(
                text: 'Intermediate',
                isSelected: selectedLevel == 'Intermediate',
                onTap: () => setState(() => selectedLevel = 'Intermediate'),
              ),
              SizedBox(width: 15,),
              WorkoutLevelTab(
                text: 'Advanced',
                isSelected: selectedLevel == 'Advanced',
                onTap: () => setState(() => selectedLevel = 'Advanced'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Training of the Day
                WorkoutOfTheDayCard(
                  imagePath: data['trainingOfTheDay']['imagePath'],
                  title: data['trainingOfTheDay']['title'],
                  duration: data['trainingOfTheDay']['duration'],
                  calories: data['trainingOfTheDay']['calories'],
                  exercises: data['trainingOfTheDay']['exercises'],
                  level: data['trainingOfTheDay']['level'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkoutDetailScreen(
                          workoutTitle: data['trainingOfTheDay']['title'],
                          workoutLevel: data['trainingOfTheDay']['level'],
                          workoutDuration: data['trainingOfTheDay']['duration'],
                          workoutCalories: data['trainingOfTheDay']['calories'],
                          workoutExercises: data['trainingOfTheDay']['exercises'],
                          // Pass specific exercises and rounds data here
                          rounds: _getWorkoutRounds(data['trainingOfTheDay']['title']),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Other Workouts Section
                Padding(
                  padding: AppPadding.pageHorizontal,
                  child: TitleText(
                    text: data['otherWorkoutsTitle'],
                    color: AppColors.yellow,
                    fontSize: 20,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 10),
                ...data['otherWorkouts'].map<Widget>((workout) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: WorkoutListItem(
                      imagePath: workout['imagePath'],
                      title: workout['title'],
                      duration: workout['duration'],
                      calories: workout['calories'],
                      exercises: workout['exercises'],
                      level: workout['level'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutDetailScreen(
                              workoutTitle: workout['title'],
                              workoutLevel: workout['level'],
                              workoutDuration: workout['duration'],
                              workoutCalories: workout['calories'],
                              workoutExercises: workout['exercises'],
                              rounds: _getWorkoutRounds(workout['title']),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),

                ],
              )
    ),
    );
  }

  // Helper function to get sample rounds data based on workout title
  List<Map<String, dynamic>> _getWorkoutRounds(String workoutTitle) {
    if (workoutTitle.contains('Functional Training')) {
      return [
        {'title': 'Round 1', 'exercises': [{'name': 'Dumbbell Rows', 'duration': '00:30', 'reps': 'Repetition 3x'}, {'name': 'Russian Twists', 'duration': '00:15', 'reps': 'Repetition 2x'}, {'name': 'Squats', 'duration': '00:30', 'reps': 'Repetition 3x'}]},
        {'title': 'Round 2', 'exercises': [{'name': 'Tabata Intervals', 'duration': '00:10', 'reps': 'Repetition 2x'}, {'name': 'Bicycle Crunches', 'duration': '00:45', 'reps': 'Repetition 4x'}]},
      ];
    } else if (workoutTitle.contains('Cardio Fitness')) {
      return [
        {'title': 'Round 1', 'exercises': [{'name': 'Kettlebell Swing', 'duration': '00:30', 'reps': 'Repetition 3x'}, {'name': 'Shoulder Press', 'duration': '00:30', 'reps': 'Repetition 2x'}, {'name': 'Hamstring Curls', 'duration': '00:30', 'reps': 'Repetition 3x'}]},
        {'title': 'Round 2', 'exercises': [{'name': 'Biceps Curls', 'duration': '00:10', 'reps': 'Repetition 2x'}, {'name': 'Barbell Deadlift', 'duration': '00:45', 'reps': 'Repetition 4x'}]},
      ];
    } else if (workoutTitle.contains('Upper Body Strength')) {
      return [
        {'title': 'Round 1', 'exercises': [{'name': 'Barbell Bench Press', 'duration': '00:30', 'reps': 'Repetition 3x'}, {'name': 'Tricep Dips', 'duration': '00:30', 'reps': 'Repetition 2x'}, {'name': 'Incline Bench Sit Up', 'duration': '00:30', 'reps': 'Repetition 3x'}]},
        {'title': 'Round 2', 'exercises': [{'name': 'Romanian Deadlifts', 'duration': '00:30', 'reps': 'Repetition 2x'}, {'name': 'Foam Rolling', 'duration': '00:45', 'reps': 'Repetition 4x'}]},
      ];
    }
    return [];
  }
}