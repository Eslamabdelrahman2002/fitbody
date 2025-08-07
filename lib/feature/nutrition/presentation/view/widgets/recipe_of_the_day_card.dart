import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class RecipeOfTheDayCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final VoidCallback onTap;

  const RecipeOfTheDayCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RecipeOfTheDayCard> createState() => _RecipeOfTheDayCardState();
}

class _RecipeOfTheDayCardState extends State<RecipeOfTheDayCard> {
  bool _isFavorited = false;

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
          padding: const EdgeInsets.all(25.0),
          child: GestureDetector(
            onTap: widget.onTap,
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
                        text: 'Recipe Of The Day',
                        color: AppColors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(AppRadius.contentBox),
                          bottomRight: Radius.circular(AppRadius.contentBox),
                        ),
                        color: AppColors.black.withOpacity(.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 15),
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