import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class WorkoutListItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final String exercises;
  final String level;
  final VoidCallback onTap;

  const WorkoutListItem({
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
  State<WorkoutListItem> createState() => _WorkoutListItemState();
}

class _WorkoutListItemState extends State<WorkoutListItem> {
  bool _isFavorited = false; // Internal state for the star icon

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    // Add your logic to save or remove from favorites here
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.contentBox),
          ),
          padding: const EdgeInsets.only(left: 12,),
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
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.fitness_center, color: AppColors.black, size: 14),
                        SizedBox(width: 5),
                        ParagraphText(text: widget.exercises, color: AppColors.black, fontSize: 12, textAlign: TextAlign.left),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Stack( // استخدام Stack لوضع النجمة فوق الصورة
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.button),
                    child: Image.asset(
                      widget.imagePath,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: _toggleFavorite, // تفعيل تغيير اللون عند الضغط
                      child: Icon(
                        Icons.star,
                        color: _isFavorited ? AppColors.yellow : AppColors.white.withOpacity(0.5), // تغيير اللون
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}