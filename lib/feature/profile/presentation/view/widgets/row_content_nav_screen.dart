import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/costant/color.dart';

class RowContentNavScreen extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const RowContentNavScreen({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Use InkWell for tap effect
      onTap: onTap,
      child: Container(
        padding:AppPadding.contentBox,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.purpleLight, // Darker purple for the icon background
                shape: BoxShape.circle, // Circular icon background
              ),
              child: FaIcon(
                icon,
                color: AppColors.white, // White icon color
                size: 28,
              ),
            ),
            SizedBox(width: 15,),
            ScreenTitleText(
              text: text,
                color: AppColors.white, // White text color
              ),
            Spacer(),
            FaIcon(
              Icons.play_arrow, // Yellow arrow icon
              color: AppColors.yellow, // Yellow color for the arrow
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}