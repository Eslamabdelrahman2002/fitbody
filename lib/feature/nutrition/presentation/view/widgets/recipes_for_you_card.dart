import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class RecipesForYouCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final VoidCallback onTap;

  const RecipesForYouCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RecipesForYouCard> createState() => _RecipesForYouCardState();
}

class _RecipesForYouCardState extends State<RecipesForYouCard> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.contentBox),
        ),
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubtitleText(
                    text: widget.title,
                    color: AppColors.black,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: AppColors.black, size: 14),
                      SizedBox(width: 5),
                      ParagraphText(text: widget.duration, color: AppColors.black, fontSize: 12, textAlign: TextAlign.left),
                      SizedBox(width: 10),
                      Icon(Icons.local_fire_department_outlined, color: AppColors.black, size: 14),
                      SizedBox(width: 5),
                      ParagraphText(text: widget.calories, color: AppColors.black, fontSize: 12, textAlign: TextAlign.left),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.button),
                  child: Image.asset(
                    widget.imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: _toggleFavorite,
                    child: Icon(
                      Icons.star,
                      color: _isFavorited ? AppColors.yellow : AppColors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}