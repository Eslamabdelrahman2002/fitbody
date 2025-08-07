import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class NotificationItemCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String time;

  const NotificationItemCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15), // Spacing between cards
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white, // Background color of the notification card
        borderRadius: BorderRadius.circular(AppRadius.button), // Rounded corners
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.purpleLight, // White background for the icon circle
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.white, // Icon color
              size: 24,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubtitleText( // Using SubtitleText for the main title
                  text: title,
                  color: AppColors.black,
                  textAlign: TextAlign.left,
                  fontSize: 16, // Adjust font size for notification title
                ),
                const SizedBox(height: 4),
                ParagraphText( // Using ParagraphText for date and time
                  text: '$date - $time',
                  color: AppColors.purpleLight,
                  textAlign: TextAlign.left,
                  fontSize: 12, // Smaller font for date/time
                ),
              ],
            ),
          ),
          // Optional: Add a trailing icon if needed, like a dismiss icon
          // Icon(Icons.more_vert, color: AppColors.white.withOpacity(0.7), size: 20),
        ],
      ),
    );
  }
}