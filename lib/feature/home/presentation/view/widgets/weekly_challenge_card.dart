import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart'; // Assuming AppRadius is correctly defined and imported

class WeeklyChallengeCard extends StatelessWidget {
  final String imagePath;
  final String challengeTitle;
  final String challengeDescription;
  final VoidCallback onTap;

  const WeeklyChallengeCard({
    Key? key,
    required this.imagePath,
    required this.challengeTitle,
    required this.challengeDescription,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // This container seems to be for a background fill, ensure its purpose aligns with design.
          // If it's meant to be behind the main card, its height might need adjustment relative to the card.
          Container(
            height: 200, // This height might need to be dynamic or tied to the main card's height
            width: double.infinity,
            color: AppColors.purpleLight, // Keep color here if it's a distinct background
          ),
          Padding( // Added Padding to create the margin for the Stack's children
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              // REMOVED: color: AppColors.black,
              // The color should be inside BoxDecoration when decoration is used
              // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Margin moved to Padding
              decoration: BoxDecoration(
                color: AppColors.black, // <-- Move color inside BoxDecoration
                borderRadius: BorderRadius.circular(AppRadius.contentBox),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Assuming TitleText and SubtitleText are custom widgets that accept fontSize and textAlign
                          // If not, you might need to adjust them or use standard Text widgets.
                          TitleText( //
                            text: challengeTitle, //
                            color: AppColors.yellow, //
                             fontSize: 30, // If TitleText doesn't have fontSize, remove this
                            // textAlign: TextAlign.left, // If TitleText doesn't have textAlign, remove this
                          ),
                          const SizedBox(height: 8), //
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SubtitleText( //
                              text: challengeDescription, //
                              color: AppColors.white, //
                              // fontSize: 14, // If SubtitleText doesn't have fontSize, remove this
                               textAlign: TextAlign.center, // If SubtitleText doesn't have textAlign, remove this
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded( //
                    flex: 1, //
                    child: ClipRRect( //
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(AppRadius.contentBox)), //
                      child: Image.asset( //
                        imagePath, //
                        height: 150, // Fixed height for the image
                        fit: BoxFit.fill, //
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}