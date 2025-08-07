import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopSearchItem extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const TopSearchItem({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white, // Background color of the search item
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow
                ),
                child: FaIcon(Icons.search_outlined, color: AppColors.purpleLight, size: 25)),
            SizedBox(width: 10),
            SubtitleText( // Using SubtitleText for the top search items
              text: text,
              color: AppColors.black,
              textAlign: TextAlign.left,
              fontSize: 15, // Adjust font size as needed
            ),
          ],
        ),
      ),
    );
  }
}