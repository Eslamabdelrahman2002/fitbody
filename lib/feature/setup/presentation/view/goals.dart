import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/setup/presentation/view/level.dart';
import 'package:fitness_app/feature/setup/presentation/view/widgets/back_button.dart';
import 'package:fitness_app/feature/setup/presentation/view/widgets/goal_option.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/costant/color.dart';
import '../../../../core/costant/text.dart';
import '../../../auth/presentation/view/widgets/button.dart';
class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  String? _selectedGoal;

  final List<String> _goals = [
    'Lose Weight',
    'Gain Weight',
    'Muscle Mass Gain',
    'Shape Body',
    'Others',
  ];

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
             text:  'What Is Your Goal?',
             color: AppColors.white,
            ),
            const SizedBox(height: 31),
            ParagraphText(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ',
              color: AppColors.white,
            ),
            const SizedBox(height: 100),

            // Container without Expanded
            Container(
              padding: AppPadding.contentBox,
              width: double.infinity,
              height: 400, // Fixed height instead of Expanded
              decoration: BoxDecoration(
                color: AppColors.purpleLight,
              ),
              child: ListView.builder(
                itemCount: _goals.length,
                itemBuilder: (context, index) {
                  final goal = _goals[index];
                  return GoalOption(
                    goalText: goal,
                    groupValue: _selectedGoal,
                    onChanged: (value) {
                      setState(() {
                        _selectedGoal = value;
                      });
                    },
                  );
                },
              ),
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Button(
                onButtonPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Level()));
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

