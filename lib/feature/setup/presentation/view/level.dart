import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/setup/presentation/view/profile.dart';
import 'package:fitness_app/feature/setup/presentation/view/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/feature/setup/presentation/view/widgets/level_button.dart';

import '../../../auth/presentation/view/widgets/button.dart'; // Import LevelButton

class Level extends StatefulWidget {
  const Level({super.key});

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  String? _selectedLevel; // State variable to hold the selected level

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const BackButtonScreen(),
            const SizedBox(height: 36),
            TitleText(
              text: 'Physical Activity Level',
              color: AppColors.white,
            ),
            const SizedBox(height: 31),
            ParagraphText(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ',
              color: AppColors.white,
            ),
            const SizedBox(height: 114), // Spacing before the buttons
            LevelButton(
              text: 'Beginner',
              function: () {
                setState(() {
                  _selectedLevel = 'Beginner';
                });
              },
              color: _selectedLevel == 'Beginner' ? AppColors.yellow : AppColors.white, // Conditional color
              textColor: _selectedLevel == 'Beginner' ? AppColors.black : AppColors.purple, // Conditional text color
            ),
            LevelButton(
              text: 'Intermediate',
              function: () {
                setState(() {
                  _selectedLevel = 'Intermediate';
                });
              },
              color: _selectedLevel == 'Intermediate' ? AppColors.yellow : AppColors.white, // Conditional color
              textColor: _selectedLevel == 'Intermediate' ? AppColors.black : AppColors.purple, // Conditional text color
            ),
            LevelButton(
              text: 'Advance',
              function: () {
                setState(() {
                  _selectedLevel = 'Advance';
                });
              },
              color: _selectedLevel == 'Advance' ? AppColors.yellow : AppColors.white, // Conditional color
              textColor: _selectedLevel == 'Advance' ? AppColors.black : AppColors.purple, // Conditional text color
            ),
            const Spacer(), // Pushes content to the top
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Button(onButtonPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
              },
                buttonText: 'Continue',
                padding: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}