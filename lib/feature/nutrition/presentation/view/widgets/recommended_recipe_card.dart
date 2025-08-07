import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class RecommendedRecipeCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final VoidCallback onTap;
  final bool hasVideo;

  const RecommendedRecipeCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.onTap,
    this.hasVideo = false,
  }) : super(key: key);

  @override
  State<RecommendedRecipeCard> createState() => _RecommendedRecipeCardState();
}

class _RecommendedRecipeCardState extends State<RecommendedRecipeCard> {
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
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(AppRadius.contentBox),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.contentBox)),
                  child: Image.asset(
                    widget.imagePath,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: _toggleFavorite,
                    child: Icon(
                      Icons.star,
                      color: _isFavorited ? AppColors.yellow : AppColors.white,
                      size: 24,
                    ),
                  ),
                ),
                if (widget.hasVideo)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.purpleLight,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.play_arrow, color: AppColors.white, size: 24),
                    ),
                  ),
              ],
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: AppColors.white),
                    right: BorderSide(color: AppColors.white),
                    bottom: BorderSide(color: AppColors.white),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubtitleText(
                        text: widget.title,
                        color: AppColors.yellow,
                        fontSize: 16,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: AppColors.purple, size: 14),
                          const SizedBox(width: 5),
                          ParagraphText(
                            text: widget.duration,
                            color: AppColors.white,
                            fontSize: 12,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(width: 10),
                          Icon(Icons.local_fire_department_outlined, color: AppColors.purple, size: 14),
                          const SizedBox(width: 5),
                          ParagraphText(
                            text: widget.calories,
                            color: AppColors.white,
                            fontSize: 12,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}