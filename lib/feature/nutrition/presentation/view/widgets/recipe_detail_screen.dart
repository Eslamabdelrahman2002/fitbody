import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key});

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
                color: AppColors.purple,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.contentBox)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: AppPadding.pageHorizontal.copyWith(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 20),
                        ),
                        Row(
                          children: [
                            Icon(Icons.search, color: AppColors.white),
                            SizedBox(width: 15),
                            Icon(Icons.notifications, color: AppColors.white),
                            SizedBox(width: 15),
                            Icon(Icons.person, color: AppColors.white),
                          ],
                        ),
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
                              SubtitleText(text: 'Avocado And Egg Toast', color: AppColors.white, textAlign: TextAlign.left),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: AppColors.white, size: 14),
                                  SizedBox(width: 5),
                                  ParagraphText(text: '15 Minutes', color: AppColors.white, fontSize: 12),
                                  SizedBox(width: 10),
                                  Icon(Icons.local_fire_department_outlined, color: AppColors.white, size: 14),
                                  SizedBox(width: 5),
                                  ParagraphText(text: '150 Cal', color: AppColors.white, fontSize: 12),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.contentBox),
                    child: Image.asset(
                      'assets/images/avocado_egg_toast.png',
                      height: 200,
                      fit: BoxFit.cover,
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
                    TitleText(text: 'Ingredients', color: AppColors.white, fontSize: 20, textAlign: TextAlign.left),
                    const SizedBox(height: 10),
                    ParagraphText(
                      text: '- Wholemeal bread\n- Ripe avocado slices\n- Fried or poached egg',
                      color: AppColors.white,
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    TitleText(text: 'Preparation', color: AppColors.white, fontSize: 20, textAlign: TextAlign.left),
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