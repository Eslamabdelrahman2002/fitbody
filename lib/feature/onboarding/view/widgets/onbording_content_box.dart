import 'package:flutter/material.dart';

import '../../../../core/costant/app_padding.dart';
import '../../../../core/costant/app_radius.dart';
import '../../../../core/costant/color.dart';
import '../../../../core/costant/text.dart';

class OnboardingContentBox extends StatelessWidget {
  final String title;
  final IconData icon;
  // Removed buttonText and onButtonPressed from here
  final int currentPage; // Added to manage internal page indicator
  final int totalPages; // Added to manage internal page indicator

  const OnboardingContentBox({
    super.key,
    required this.title,
    required this.icon,
    required this.currentPage, // Required
    required this.totalPages, // Required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Ensures it takes full screen width
      padding: AppPadding.contentBox,
      decoration: BoxDecoration(
        color: AppColors.purpleLight, // Changed to purpleLight as per your uploaded file
        // borderRadius: BorderRadius.circular(AppRadius.contentBox), // Removed borderRadius as per your uploaded file
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.0),
        //     spreadRadius: 2,
        //     blurRadius: 8,
        //     offset: const Offset(0, 4),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: AppPadding.iconBottom,
            child: Icon(
              icon,
              color: AppColors.yellow, // Using AppColors.yellow for the icon as per image
              size: 48.0,
            ),
          ),
          ScreenTitleText(text: title, color: AppColors.white), // Using TitleText from your file
          const SizedBox(height: 16), // Adjusted spacing
          _buildInternalPageIndicator(), // New: Internal page indicator
          // Removed button from here
        ],
      ),
    );
  }

  // New method to build the internal page indicator dots
  Widget _buildInternalPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 150), // Re-using animation duration
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: currentPage == index ? 24.0 : 8.0,
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.yellow : AppColors.white, // Yellow for current, light purple for others
            borderRadius: BorderRadius.circular(AppRadius.pageIndicator),
          ),
        ),
      ),
    );
  }
}
