import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/core/costant/app_padding.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/trophy.png',
                height: 200,
              ),
              const SizedBox(height: 30),
              TitleText(
                text: 'Congratulations!',
                color: AppColors.white,
                fontSize: 30,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(AppRadius.contentBox),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMetric('2 Hours', Icons.access_time),
                    _buildMetric('300 Calories', Icons.local_fire_department_outlined),
                    _buildMetric('Moderate', Icons.star),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  // Navigate to the next workout
                },
                child: Container(
                  padding: AppPadding.buttonVertical,
                  decoration: BoxDecoration(
                    color: AppColors.purpleLight,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  child: Center(
                    child: ButtonText(
                      text: 'Go to the next workout',
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  // Navigate back to the home screen
                },
                child: Container(
                  padding: AppPadding.buttonVertical,
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  child: Center(
                    child: ButtonText(
                      text: 'Home',
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetric(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.black, size: 20),
        SizedBox(width: 5),
        ParagraphText(
          text: text,
          color: AppColors.black,
          fontSize: 14,
        ),
      ],
    );
  }
}