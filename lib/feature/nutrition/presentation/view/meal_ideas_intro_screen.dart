import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/meal_ideas_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../auth/presentation/view/widgets/button.dart';

class MealIdeasIntroScreen extends StatelessWidget {
  const MealIdeasIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Rectangle 160 (1).png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              height: 140,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                color: AppColors.purpleLight,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          Icons.apple_outlined,
                          color: AppColors.yellow,
                          size: 45,
                        ),
                        SizedBox(width: 2),
                        Align(
                          alignment: Alignment.center,
                          child: TitleText(
                            text: "Meal Ideas",
                            color: AppColors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const ParagraphText(
                    text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            Button(
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MealIdeasScreen(),
                  ),
                );
              },
              buttonText: 'Discover',
              padding: 70,
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}