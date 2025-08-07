

import 'package:flutter/material.dart';

import '../../../../../core/costant/app_padding.dart';
import '../../../../../core/costant/app_radius.dart';
import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onButtonPressed,
    required this.buttonText, required this.padding,
  });

  final VoidCallback onButtonPressed;
  final String buttonText;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.buttonVertical,
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white.withOpacity(.15),
          side: const BorderSide(color: Colors.white),
          foregroundColor: AppColors.white,
          padding: AppPadding.buttonVertical,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 5,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: ButtonText(
            text: buttonText,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
