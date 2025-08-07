import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class FeaturedExerciseCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final String level;
  final VoidCallback onTap;

  const FeaturedExerciseCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.level,
    required this.onTap,
  }) : super(key: key);

  @override
  State<FeaturedExerciseCard> createState() => _FeaturedExerciseCardState();
}

class _FeaturedExerciseCardState extends State<FeaturedExerciseCard> {
  bool _isFavorited = false; // State for the star icon

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.purpleLight
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:35,vertical: 22 ),
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: 200, // Adjusted height to better match the image
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(AppRadius.contentBox),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.contentBox),
                    child: Image.asset(
                     widget.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(AppRadius.contentBox),
                          topRight: Radius.circular(AppRadius.contentBox),
                        ),
                      ),
                      child: ParagraphText(
                        text: widget.title,
                        color: AppColors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(AppRadius.contentBox),
                          bottomRight: Radius.circular(AppRadius.contentBox),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: AppColors.white, size: 14),
                                  SizedBox(width: 5),
                                  ParagraphText(text: widget.duration, color: AppColors.white, fontSize: 12),
                                  SizedBox(width: 10),
                                  Icon(Icons.local_fire_department_outlined, color: AppColors.white, size: 14),
                                  SizedBox(width: 5),
                                  ParagraphText(text: widget.calories, color: AppColors.white, fontSize: 12),
                                  SizedBox(width: 10),
                                  Icon(Icons.directions_run, color: AppColors.white, size: 14),
                                  SizedBox(width: 5),
                                  ParagraphText(text: widget.level, color: AppColors.white, fontSize: 12),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: _toggleFavorite,
                            child: Icon(
                              Icons.star,
                              color: _isFavorited ? AppColors.yellow : AppColors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}