import 'package:fitness_app/core/costant/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/costant/color.dart';

class ProfileDetailCard extends StatelessWidget {
  const ProfileDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.purple, // White background for the card
        borderRadius: BorderRadius.circular(20),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDetailColumn('75 Kg', 'Weight'), // Weight detail
          _buildDivider(),
          _buildDetailColumn('28', 'Years Old'), // Age detail
          _buildDivider(),
          _buildDetailColumn('1.65 CM', 'Height'), // Height detail
        ],
      ),
    );
  }

  Widget _buildDetailColumn(String value, String label) {
    return Column(
      children: [
        SubtitleText(
         text:  value,
            color: AppColors.white,
        ),
        ParagraphText(text:
          label,
            color: AppColors.white, // Darker color for labels

        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40, // Height of the divider
      width: 1, // Thickness of the divider
      color: AppColors.white, // Color of the divider
    );
  }
}