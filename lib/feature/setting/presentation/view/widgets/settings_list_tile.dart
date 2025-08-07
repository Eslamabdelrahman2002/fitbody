import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const SettingsListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.purple, // Background circle color
                shape: BoxShape.circle,
              ),
              child: FaIcon(
                icon,
                color: AppColors.white, // Icon color
                size: 29,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: SubtitleText(
                text: text,
                color: AppColors.white,
                textAlign: TextAlign.left,
              ),
            ),
            FaIcon(
              Icons.arrow_drop_down,
              color: AppColors.yellow,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}