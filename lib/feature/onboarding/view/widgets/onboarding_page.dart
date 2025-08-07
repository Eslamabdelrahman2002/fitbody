
import 'package:fitness_app/feature/onboarding/view/widgets/skip_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/costant/app_padding.dart';
import '../../../../core/costant/app_radius.dart';
import '../../../../core/costant/color.dart';
import '../../../../core/costant/text.dart';
import 'onbording_content_box.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String buttonText;
  final IconData icon;
  final VoidCallback onButtonPressed;
  final VoidCallback onSkipPressed;
  final int currentPage; // Added to manage internal page indicator
  final int totalPages;  // Added to manage internal page indicator

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.buttonText,
    required this.icon,
    required this.onButtonPressed,
    required this.onSkipPressed,
    required this.currentPage, // Required
    required this.totalPages,  // Required
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(),
        _buildGradientOverlay(),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.4,
          left: 0,
          right: 0,
          child: OnboardingContentBox(
            title: title,
            icon: icon,
            currentPage: currentPage, // Pass to content box
            totalPages: totalPages,   // Pass to content box
            // buttonText and onButtonPressed are no longer passed to OnboardingContentBox
          ),
        ),
        // Position the main action button below the content box
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.27, // Adjust this value as needed
          left: 50,
          right: 50,
          child: Padding(
            padding: AppPadding.contentBox,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white.withOpacity(.2), // Using AppColors.white from your file
                  foregroundColor: AppColors.white, // Using AppColors.purple from your file
                  padding: AppPadding.buttonVertical,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  elevation: 5,
                ),
                child: ButtonText(text: buttonText, color: AppColors.white), // Custom ButtonText
              ),
            ),
          ),
        ),
        SkipButton(onPressed: onSkipPressed),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey, // Using direct Color as it's not in provided AppColors
            child: const Center(
              child: Text(
                'Image not found\n(Add to pubspec.yaml and assets folder)',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.white), // Using AppColors.white
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration( // Changed here: directly assign LinearGradient to BoxDecoration's gradient property
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.5),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }
}