import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class NutritionDetailInfoCard extends StatefulWidget {
  final String imagePath;
  final String workoutTitle;
  final String workoutDuration;
  final String workoutCalories;
  final VoidCallback onTap;

  const NutritionDetailInfoCard({
    Key? key,
    required this.imagePath,
    required this.workoutTitle,
    required this.workoutDuration,
    required this.workoutCalories,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NutritionDetailInfoCard> createState() => _NutritionDetailInfoCardState();
}

class _NutritionDetailInfoCardState extends State<NutritionDetailInfoCard> {
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
                        text: 'Recipe of the day',
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
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(AppRadius.contentBox),
                          bottomRight: Radius.circular(AppRadius.contentBox),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SubtitleText(
                                  text: widget.workoutTitle,
                                  color: AppColors.yellow,
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, color: AppColors.white, size: 14),
                                    SizedBox(width: 5),
                                    ParagraphText(text: widget.workoutDuration, color: AppColors.white, fontSize: 12),
                                    SizedBox(width: 10),
                                    Icon(Icons.local_fire_department_outlined, color: AppColors.white, size: 14),
                                    SizedBox(width: 5),
                                    ParagraphText(text: widget.workoutCalories, color: AppColors.white, fontSize: 12),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
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