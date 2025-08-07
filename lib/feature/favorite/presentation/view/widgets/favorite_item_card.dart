import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:google_fonts/google_fonts.dart'; // Ensure you have this file

class FavoriteItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String type; // 'video' or 'article'
  final String? duration; // For videos
  final String? calories; // For videos
  final String? exercises; // For videos
  final String? description; // For articles

  const FavoriteItemCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.type,
    this.duration,
    this.calories,
    this.exercises,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purple, // Background color of the card
        borderRadius: BorderRadius.circular(AppRadius.contentBox), // Rounded corners
      ),
      padding: EdgeInsets.all(12), // Inner padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.button), // Smaller radius for image
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  text: title,
                  color: AppColors.white,
                  fontSize: 18, // Adjust font size for card titles
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                if (type == 'video' && duration != null && calories != null && exercises != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, color: AppColors.white, size: 14),
                          SizedBox(width: 5),
                          ParagraphText(
                            text: duration!,
                            color: AppColors.white,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.local_fire_department_outlined, color: AppColors.white, size: 14),
                          SizedBox(width: 5),
                          ParagraphText(
                            text: calories!,
                            color: AppColors.white,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.fitness_center, color: AppColors.white, size: 14),
                          SizedBox(width: 5),
                          ParagraphText(
                            text: exercises!,
                            color: AppColors.white,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                if (type == 'article' && description != null)
                  ParagraphText(
                    text: description!,
                    color: AppColors.white.withOpacity(0.8),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          // Bookmark Icon (Star)
          Icon(Icons.star, color: AppColors.yellow, size: 24), // Yellow star
        ],
      ),
    );
  }
}

// Extend TitleText and ParagraphText to allow for font size and text alignment overrides
// You might want to move this into your 'text.dart' file for better organization.
// For now, I'll add them here for demonstration purposes.

extension CustomTitleText on TitleText {
  TitleText copyWith({
    String? text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return TitleText(
      text: text ?? this.text,
      color: color ?? this.color,
      textAlign: textAlign ?? this.textAlign,
    );
  }
}

extension CustomParagraphText on ParagraphText {
  ParagraphText copyWith({
    String? text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return ParagraphText(
      text: text ?? this.text,
      color: color ?? this.color,
      textAlign: textAlign ?? this.textAlign,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
    );
  }
}