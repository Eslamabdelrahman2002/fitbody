import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final String ingredients;
  final String preparation;

  const RecipeDetailScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.ingredients,
    required this.preparation,
  }) : super(key: key);

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.contentBox)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: AppPadding.pageHorizontal.copyWith(top: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_left, color: AppColors.yellow, size: 25),
                        ),
                        ScreenTitleText(text: 'Meal plans',color: AppColors.purple,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: AppPadding.pageHorizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(text: widget.title, color: AppColors.yellow, textAlign: TextAlign.left,fontSize: 19,),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: AppColors.purpleLight, size: 14),
                                  SizedBox(width: 5),
                                  ParagraphText(text: widget.duration, color: AppColors.white, fontSize: 12),
                                  SizedBox(width: 10),
                                  Icon(Icons.local_fire_department_outlined, color: AppColors.purpleLight, size: 14),
                                  SizedBox(width: 5),
                                  ParagraphText(text: widget.calories, color: AppColors.white, fontSize: 12),
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
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    color: AppColors.purpleLight,
                    height: 270,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.contentBox),
                        child: Image.asset(
                          widget.imagePath,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: AppPadding.pageHorizontal.copyWith(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    TitleText(text: 'Ingredients', color: AppColors.yellow, fontSize: 20, textAlign: TextAlign.left),
                    const SizedBox(height: 10),
                    ParagraphText(
                      text: widget.ingredients,
                      color: AppColors.white,
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    TitleText(text: 'Preparation', color: AppColors.yellow, fontSize: 20, textAlign: TextAlign.left),
                    const SizedBox(height: 10),
                    ParagraphText(
                      text: widget.preparation,
                      color: AppColors.white,
                      textAlign: TextAlign.left,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
              child: GestureDetector(
                onTap: () {
                  // Handle Save Recipes
                },
                child: Container(
                  width: double.infinity,
                  padding: AppPadding.buttonVertical,
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  child: Center(
                    child: ButtonText(
                      text: 'Save Recipes',
                      color: AppColors.black,
                    ),
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