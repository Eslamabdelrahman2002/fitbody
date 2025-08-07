import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class MostPopularExerciseItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final VoidCallback onTap;

  const MostPopularExerciseItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MostPopularExerciseItem> createState() => _MostPopularExerciseItemState();
}

class _MostPopularExerciseItemState extends State<MostPopularExerciseItem> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: widget.onTap, // Keep the card's main tap functionality
      child: Container(
        width: 180, // Fixed width for the card as per image
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.contentBox),
          border: Border.all(color: AppColors.purple, width: 1), // Purple border with width 1
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack( // Use Stack to layer image, star, and play button
              clipBehavior: Clip.none, // Allow children to go outside the stack bounds
              children: [
                Container( // Container to hold the image with its specific border
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white, width: 1)), // White border at the bottom of the image
                  ),
                  child: ClipRRect(
                    // Only top corners are rounded for the image
                    borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.contentBox)),
                    child: Image.asset(
                      widget.imagePath,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: _toggleFavorite,
                    child: Icon(
                      Icons.star,
                      color: _isFavorited ? AppColors.yellow : Colors.white.withOpacity(0.5), // Yellow if favorited, 50% opacity white otherwise
                      size: 24,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -16, // Adjust this value to control how much it overlaps downwards
                  right: 5,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.purpleLight, // Play button background color
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.play_arrow, color: AppColors.white, size: 24), // Play icon
                    ),
                  ),
                ),
              ],
            ),
            // Padding for the text content
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 8), // Adjusted top padding to account for overlapping play button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubtitleText(
                    text: widget.title,
                    color: AppColors.white,
                    fontSize: 16,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: AppColors.purple, size: 14), // Icon color is purple
                      SizedBox(width: 5),
                      ParagraphText(
                        text: widget.duration,
                        color: AppColors.white,
                        fontSize: 12,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.local_fire_department_outlined, color: AppColors.purple, size: 14), // Icon color is purple
                      SizedBox(width: 5),
                      ParagraphText(
                        text: widget.calories,
                        color: AppColors.white,
                        fontSize: 10,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}