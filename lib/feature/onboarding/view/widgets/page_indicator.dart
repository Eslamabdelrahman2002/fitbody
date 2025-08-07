import 'package:flutter/material.dart';

import '../../../../core/costant/app_durations.dart';
import '../../../../core/costant/app_radius.dart';
import '../../../../core/costant/color.dart';

class PageIndicator extends StatelessWidget {
  final int itemCount;
  final int currentPage;

  const PageIndicator({
    super.key,
    required this.itemCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
            (index) => AnimatedContainer(
          duration: AppDurations.pageIndicatorAnimation,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: currentPage == index ? 24.0 : 8.0,
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.white : Colors.white54, // Using AppColors.white
            borderRadius: BorderRadius.circular(AppRadius.pageIndicator),
          ),
        ),
      ),
    );
  }
}