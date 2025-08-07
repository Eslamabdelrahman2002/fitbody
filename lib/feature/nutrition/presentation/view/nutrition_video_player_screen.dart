import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class NutritionVideoPlayerScreen extends StatefulWidget {
  final String recipeTitle;
  final String imagePath;
  final String? duration;
  final String? calories;

  const NutritionVideoPlayerScreen({
    Key? key,
    required this.recipeTitle,
    required this.imagePath,
    this.duration,
    this.calories,
  }) : super(key: key);

  @override
  State<NutritionVideoPlayerScreen> createState() => _NutritionVideoPlayerScreenState();
}

class _NutritionVideoPlayerScreenState extends State<NutritionVideoPlayerScreen> {
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
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left, color: AppColors.yellow,size: 25,),
          onPressed: () => Navigator.pop(context),
        ),
        title: const ScreenTitleText(
          text: 'Meal Ideas',
          color: AppColors.purple,
          textAlign: TextAlign.left,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16), // Padding from the top of the safe area
            Padding(
              padding: AppPadding.pageHorizontal,
              child: Row(
                children: [
                  Expanded(
                    child: SubtitleText(
                      text: widget.recipeTitle,
                      color: AppColors.yellow,
                      fontSize: 23,
                      textAlign: TextAlign.left,
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
            const SizedBox(height: 15),
            Padding(
              padding: AppPadding.pageHorizontal,
              child: Row(
                children: [
                  Icon(Icons.access_time, color: AppColors.purple, size: 14),
                  SizedBox(width: 5),
                  ParagraphText(text: widget.duration ?? '15 Minutes', color: AppColors.white, fontSize: 12),
                  SizedBox(width: 10),
                  Icon(Icons.local_fire_department_outlined, color: AppColors.purple, size: 14),
                  SizedBox(width: 5),
                  ParagraphText(text: widget.calories ?? '150 Cal', color: AppColors.white, fontSize: 12),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.contentBox)),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(color: AppColors.purpleLight,height:350,width: double.infinity,),
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.contentBox)),
                                      child: Image.asset(
                                        widget.imagePath,
                                        height: 300,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.contentBox),top: Radius.circular(AppRadius.contentBox)),
                                          color: AppColors.black.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Icon(
                                        Icons.play_circle_fill,
                                        color: AppColors.purpleLight,
                                        size: 80,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppPadding.pageHorizontal.copyWith(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(text: 'Ingredients', color: AppColors.yellow, fontSize: 20, textAlign: TextAlign.left),
                          const SizedBox(height: 10),
                          ParagraphText(
                            text: '- 1/2 cup plain Greek yogurt\n- 1/2 cup almond milk or your favorite milk\n- Honey or maple syrup (optional, to sweeten to taste)',
                            color: AppColors.white,
                            textAlign: TextAlign.left,
                            maxLines: 5,
                          ),
                          const SizedBox(height: 20),
                          TitleText(text: 'Preparation', color: AppColors.yellow, fontSize: 20, textAlign: TextAlign.left),
                          const SizedBox(height: 10),
                          ParagraphText(
                            text: 'Sed earum sequi est magnam doloremque aut porro dolores sit molestiae fuga. Et rerum inventore ut perspiciatis dolorum sed internos porro aut labore dolorem At quia reiciendis in consequuntur possimus.',
                            color: AppColors.white,
                            textAlign: TextAlign.left,
                            maxLines: 10,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}