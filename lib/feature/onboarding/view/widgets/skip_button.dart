import 'package:flutter/material.dart';

import '../../../../core/costant/app_padding.dart';
import '../../../../core/costant/app_radius.dart';
import '../../../../core/costant/color.dart';
import '../../../../core/costant/text.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      right: 16,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: AppPadding.skipButton,
        ),
        child: const Row(
          children: [
          ButtonText(text: 'Skip', color: AppColors.yellow), // Custom SkipText
            Icon(Icons.arrow_right, size: 25, color: AppColors.yellow), // Using AppColors.white
          ],
        ),
      ),
    );
  }
}