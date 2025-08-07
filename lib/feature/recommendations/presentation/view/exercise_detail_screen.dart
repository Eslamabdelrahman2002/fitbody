import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final String title;
  final String difficulty;
  final String imagePath;

  const ExerciseDetailScreen({
    Key? key,
    required this.title,
    required this.difficulty,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildAppBar(context),
              const SizedBox(height: 20),

              // Video/Image Section
              Container(
                decoration: BoxDecoration(
                  color: AppColors.purpleLight,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.contentBox),
                        child: Image.asset(
                          widget.imagePath,
                          height: 500,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        margin: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.contentBox),
                          color: AppColors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                    const Positioned.fill(
                      child: Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          color: AppColors.purpleLight,
                          size: 80,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 40,
                      child: GestureDetector(
                        onTap: _toggleFavorite,
                        child: Icon(
                          Icons.star,
                          color: _isFavorited
                              ? AppColors.yellow
                              : AppColors.white.withOpacity(.7),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Exercise Details
              Padding(
                padding: AppPadding.pageHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(AppRadius.contentBox),
                      ),
                      child: Column(
                        children: [
                          TitleText(
                            text: widget.title,
                            color: AppColors.black,
                            fontSize: 20,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          ParagraphText(
                            text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed cursus libero eget.',
                            color: AppColors.black.withOpacity(0.8),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time,
                                          color: AppColors.black, size: 14),
                                      const SizedBox(width: 5),
                                      ParagraphText(
                                          text:'12 Minutes',
                                          color: AppColors.black,
                                          fontSize: 12),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.directions_run,
                                          color: AppColors.black, size: 14),
                                      const SizedBox(width: 5),
                                      ParagraphText(
                                          text: widget.difficulty,
                                          color: AppColors.black,
                                          fontSize: 12),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: AppPadding.pageHorizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_left, color: AppColors.yellow, size: 25),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ScreenTitleText(
              text: widget.title,
              color: AppColors.purple,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
