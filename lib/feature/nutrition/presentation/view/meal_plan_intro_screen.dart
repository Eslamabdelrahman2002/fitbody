import 'package:fitness_app/feature/auth/presentation/view/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/meal_plan_setup_screen.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/profile/presentation/view/profile.dart';
import 'package:fitness_app/feature/search/presentation/view/search_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MealPlanIntroScreen extends StatelessWidget {
  const MealPlanIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Rectangle 160.png"),
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
                            text: "Meal Plans",
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
                    builder: (_) => const MealPlanSetupScreen(),
                  ),
                );
              },
              buttonText: 'Know your plan',
              padding: 70,
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
