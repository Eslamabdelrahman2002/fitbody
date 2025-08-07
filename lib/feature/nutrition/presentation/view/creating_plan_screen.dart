import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/meal_plan_detail_screen.dart';

class CreatingPlanScreen extends StatefulWidget {
  const CreatingPlanScreen({super.key});

  @override
  State<CreatingPlanScreen> createState() => _CreatingPlanScreenState();
}

class _CreatingPlanScreenState extends State<CreatingPlanScreen> {
  @override
  void initState() {
    super.initState();
    _startPlanCreation();
  }

  void _startPlanCreation() {
    // Simulating a network request or a loading process
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MealPlanDetailScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.purple, width: 5),
              ),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.yellow),
              ),
            ),
            const SizedBox(height: 20),
            TitleText(
              text: 'Creating A Plan For You',
              color: AppColors.white,
              fontSize: 20,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}