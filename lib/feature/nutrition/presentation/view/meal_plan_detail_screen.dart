import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/widgets/meal_plan_recipe_item.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/recipe_detail_screen.dart';

class MealPlanDetailScreen extends StatelessWidget {
  const MealPlanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // A list to hold the data for all recipes
    final List<Map<String, String>> recipes = [
      {
        'imagePath': 'assets/images/woman-helping-man-gym 1 (2).png',
        'title': 'Delights With Greek Yogurt',
        'duration': '6 Minutes',
        'calories': '200 Cal',
        'ingredients': '- 1/2 cup Greek yogurt\n- Mixed berries\n- Granola',
        'preparation': 'Sed earum sequi est magnam doloremque aut porro dolores sit molestiae fuga. Et rerum inventore ut perspiciatis dolorum sed internos porro aut labore dolorem At quia reiciendis in consequuntur possimus.',
      },
      {
        'imagePath': 'assets/images/woman-helping-man-gym 2 (1).png',
        'title': 'Spinach And Tomato Omelette',
        'duration': '10 Minutes',
        'calories': '220 Cal',
        'ingredients': '- 2-3 eggs\n- A handful of fresh spinach\n- 1 small tomato',
        'preparation': 'Sed earum sequi est magnam doloremque aut porro dolores sit molestiae fuga. Et rerum inventore ut perspiciatis dolorum sed internos porro aut labore dolorem At quia reiciendis in consequuntur possimus.',
      },
      {
        'imagePath': 'assets/images/woman-helping-man-gym 2 (2).png',
        'title': 'Avocado And Egg Toast',
        'duration': '15 Minutes',
        'calories': '150 Cal',
        'ingredients': '- Wholemeal bread\n- Ripe avocado slices\n- Fried or poached egg',
        'preparation': 'Sed earum sequi est magnam doloremque aut porro dolores sit molestiae fuga. Et rerum inventore ut perspiciatis dolorum sed internos porro aut labore dolorem At quia reiciendis in consequuntur possimus.',
      },
      {
        'imagePath': 'assets/images/woman-helping-man-gym 3 (1).png',
        'title': 'Protein Shake With Fruits',
        'duration': '9 Minutes',
        'calories': '180 Cal',
        'ingredients': '- 1 scoop protein powder\n- 1/2 cup mixed fruits\n- Milk or water',
        'preparation': 'Sed earum sequi est magnam doloremque aut porro dolores sit molestiae fuga. Et rerum inventore ut perspiciatis dolorum sed internos porro aut labore dolorem At quia reiciendis in consequuntur possimus.',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // App Bar
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_left,
                      color: AppColors.yellow,
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const ScreenTitleText(
                    text: 'Meal Plans',
                    color: AppColors.purple,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Plan Description
              TitleText(
                text: 'Breakfast Plan For You',
                color: AppColors.white,
                fontSize: 24,
                textAlign: TextAlign.left,
              ),
              ParagraphText(
                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                color: AppColors.white.withOpacity(0.7),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),

              // List of Recipes
              Expanded(
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return MealPlanRecipeItem(
                      imagePath: recipe['imagePath']!,
                      title: recipe['title']!,
                      duration: recipe['duration']!,
                      calories: recipe['calories']!,
                      onTap: () {
                        // Pass the recipe data to the detail screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailScreen(
                              imagePath: recipe['imagePath']!,
                              title: recipe['title']!,
                              duration: recipe['duration']!,
                              calories: recipe['calories']!,
                              ingredients: recipe['ingredients']!,
                              preparation: recipe['preparation']!,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              // See Recipe Button
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the first recipe detail screen when the button is pressed
                    final firstRecipe = recipes.first;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(
                          imagePath: firstRecipe['imagePath']!,
                          title: firstRecipe['title']!,
                          duration: firstRecipe['duration']!,
                          calories: firstRecipe['calories']!,
                          ingredients: firstRecipe['ingredients']!,
                          preparation: firstRecipe['preparation']!,
                        ),
                      ),
                    );
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
                        text: 'See Recipe',
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}