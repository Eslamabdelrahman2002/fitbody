import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final bool isSelected; // Added isSelected property

  const CategoryIconButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.isSelected = false, // Default to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                // color: isSelected ? AppColors.yellow : AppColors.purpleLight, // Change color based on selection
                // shape: BoxShape.circle,
              ),
              child: FaIcon(
                icon,
                color: isSelected ? AppColors.yellow : AppColors.purpleLight, // Icon color changes too
                size: 28,
              ),
            ),
            ParagraphText(
              text: text,
              color: isSelected ? AppColors.yellow : AppColors.purpleLight, // Text color changes based on selection
              fontSize: 12,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}