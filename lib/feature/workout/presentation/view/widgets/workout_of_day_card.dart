import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class WorkoutOfTheDayCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final String exercises;
  final String level;
  final VoidCallback onTap;

  const WorkoutOfTheDayCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.exercises,
    required this.level,
    required this.onTap,
  }) : super(key: key);

  @override
  State<WorkoutOfTheDayCard> createState() => _WorkoutOfTheDayCardState();
}

class _WorkoutOfTheDayCardState extends State<WorkoutOfTheDayCard> {
  bool _isFavorited = false; // Internal state for the star icon

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    // Add logic to save/remove from favorites here
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: AppColors.purpleLight,width: double.infinity,height: 250,),
        GestureDetector(
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              height: 200,
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
                        text: 'Training Of The Day',
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
                        color: AppColors.black.withOpacity(0.7), // Semi-transparent black background
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(AppRadius.contentBox),
                          bottomRight: Radius.circular(AppRadius.contentBox),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SubtitleText(
                                  text: widget.title,
                                  color: AppColors.white,
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 5),
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
                                    Icon(Icons.fitness_center, color: AppColors.white, size: 14),
                                    SizedBox(width: 5),
                                    ParagraphText(text: widget.exercises, color: AppColors.white, fontSize: 12),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
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