import 'package:fitness_app/feature/nutrition/presentation/view/widgets/nutrition_details_info_card.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/widgets/recipes_for_you_card.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/widgets/recommended_recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/meal_ideas_intro_screen.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/meal_plan_intro_screen.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/widgets/meal_plan_tab.dart';

import '../../../profile/presentation/view/profile.dart';
import '../../../search/presentation/view/search_screen.dart';


class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  String selectedTab = 'Meal Ideas'; // Set default tab to match the requested content

  final List<Map<String, dynamic>> _recommendedRecipes = [
    {
      'imagePath': 'assets/images/woman-helping-man-gym (1) 2.png',
      'title': 'Fruit Smoothie',
      'duration': '12 Minutes',
      'calories': '120 Cal',
      'hasVideo': true,
    },
    {
      'imagePath': 'assets/images/woman-helping-man-gym (1) 3.png',
      'title': 'Salads With Quinoa',
      'duration': '12 Minutes',
      'calories': '120 Cal',
      'hasVideo': true,
    },
  ];

  final List<Map<String, dynamic>> _recipesForYou = [
    {
      'imagePath': 'assets/images/woman-helping-man-gym 1 (1).png',
      'title': 'Delights With Greek Yogurt',
      'duration': '6 Minutes',
      'calories': '200 Cal',
      'hasVideo': false,
    },
    {
      'imagePath': 'assets/images/woman-helping-man-gym 2 (1).png',
      'title': 'Baked Salmon',
      'duration': '30 Minutes',
      'calories': '350 Cal',
      'hasVideo': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: AppPadding.pageHorizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_left_outlined,
                      color: AppColors.yellow,
                      size: 25,
                    ),
                  ),
                  const ScreenTitleText(
                    text: 'Nutrition', // Corrected text from 'workout' to 'Nutrition'
                    color: AppColors.purple,
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                        },
                        icon: const Icon(Icons.search, color: AppColors.purple),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
                        },
                        icon: const Icon(Icons.person, color: AppColors.purple),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: AppPadding.pageHorizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MealPlanTab(
                      text: 'Meal Plans',
                      isSelected: selectedTab == 'Meal Plans',
                      onTap: () {
                        // Navigate to MealPlanIntroScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MealPlanIntroScreen()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: MealPlanTab(
                      text: 'Meal Ideas',
                      isSelected: selectedTab == 'Meal Ideas',
                      onTap: () {
                        // Navigate to the new MealIdeasIntroScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MealIdeasIntroScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Add the content requested by the user here
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Temporary card to match the user's initial setup
                    NutritionDetailInfoCard(imagePath: "assets/images/woman-helping-man-gym (1) 1 (1).png",
                        workoutTitle:'Carrot and orange smoothie',
                        workoutDuration: '10 Minutes',
                        workoutCalories: '70 Cal',
                        onTap: (){}),
                         SizedBox(height: 20,),
                    // Recommended Section
                    Padding(
                      padding: AppPadding.pageHorizontal,
                      child: TitleText(
                        text: 'Recommended',
                        color: AppColors.yellow,
                        fontSize: 20,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: AppPadding.pageHorizontal,
                      child: SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _recommendedRecipes.length,
                          itemBuilder: (context, index) {
                            final recipe = _recommendedRecipes[index];
                            return Padding(
                              padding: EdgeInsets.only(right: index == _recommendedRecipes.length - 1 ? 0 : 15),
                              child: RecommendedRecipeCard(
                                imagePath: recipe['imagePath'],
                                title: recipe['title'],
                                duration: recipe['duration'],
                                calories: recipe['calories'],
                                hasVideo: recipe['hasVideo'],
                                onTap: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Recipes For You Section
                    Padding(
                      padding:AppPadding.pageHorizontal,
                      child: TitleText(
                        text: 'Recipes For You',
                        color: AppColors.yellow,
                        fontSize: 20,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ..._recipesForYou.map<Widget>((recipe) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15,left: 25,right: 25),
                        child: RecipesForYouCard(
                          imagePath: recipe['imagePath'],
                          title: recipe['title'],
                          duration: recipe['duration'],
                          calories: recipe['calories'],
                          onTap: () {},
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 20),
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