import 'package:fitness_app/core/costant/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/costant/color.dart';

class GoalOption extends StatelessWidget {
  final String goalText;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const GoalOption({
    required this.goalText,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SubtitleText(
                   text: goalText,
                  color: AppColors.black,
                ),
              ),
            ),
            Radio<String>(
              value: goalText,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: AppColors.purple, // Color when selected
            ),
          ],
        ),
      ),
    );
  }
}