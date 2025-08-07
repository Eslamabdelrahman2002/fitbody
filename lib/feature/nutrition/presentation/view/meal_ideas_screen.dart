import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/widgets/recipe_of_the_day_card.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/widgets/recommended_recipe_card.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/widgets/recipes_for_you_card.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/widgets/meal_idea_category_chip.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/recipe_detail_screen.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/nutrition_video_player_screen.dart';
import 'package:fitness_app/feature/profile/presentation/view/profile.dart';
import 'package:fitness_app/feature/search/presentation/view/search_screen.dart';

class MealIdeasScreen extends StatefulWidget {
  const MealIdeasScreen({super.key});

  @override
  State<MealIdeasScreen> createState() => _MealIdeasScreenState();
}

class _MealIdeasScreenState extends State<MealIdeasScreen> {
  String selectedMealCategory = 'Breakfast';

  final Map<String, dynamic> _breakfastData = {
    'recipeOfTheDay': {
      'imagePath': 'assets/images/woman-helping-man-gym 1 (2).png',
      'title': 'Spinach And Tomato Omelette',
      'duration': '10 Minutes',
      'calories': '220 Cal',
      'hasVideo': false,
      'ingredients': '- 2-3 eggs\n- A handful of fresh spinach\n- 1 small tomato',
      'preparation': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    'recommended': [
      {
        'imagePath': 'assets/images/woman-helping-man-gym 2 (1).png',
        'title': 'Fruit Smoothie',
        'duration': '12 Minutes',
        'calories': '120 Cal',
        'hasVideo': true,
      },
      {
        'imagePath': 'assets/images/woman-helping-man-gym 2 (2).png',
        'title': 'Green Celery Juice',
        'duration': '12 Minutes',
        'calories': '120 Cal',
        'hasVideo': true,
      },
    ],
    'recipesForYou': [
      {
        'imagePath': 'assets/images/woman-helping-man-gym 3 (1).png',
        'title': 'Delights With Greek Yogurt',
        'duration': '6 Minutes',
        'calories': '200 Cal',
        'hasVideo': false,
        'ingredients': '- 1/2 cup Greek yogurt\n- Mixed berries\n- Granola',
        'preparation': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      },
      {
        'imagePath': 'assets/images/woman-helping-man-gym 2 (2).png',
        'title': 'Avocado And Egg Toast',
        'duration': '15 Minutes',
        'calories': '150 Cal',
        'hasVideo': false,
        'ingredients': '- Wholemeal bread\n- Ripe avocado slices\n- Fried or poached egg',
        'preparation': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      },
    ],
  };

  final Map<String, dynamic> _lunchData = {
    'recipeOfTheDay': {
      'imagePath': 'assets/images/woman-helping-man-gym 4 (2).png',
      'title': 'Grilled Chicken Salad',
      'duration': '20 Minutes',
      'calories': '240 Cal',
      'hasVideo': false,
      'ingredients': '- 1 chicken breast\n- Salad greens\n- Dressing',
      'preparation': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    'recommended': [
      {
        'imagePath': 'assets/images/woman-helping-man-gym (1) 3.png',
        'title': 'Chickpea Salad',
        'duration': '20 Minutes',
        'calories': '300 Cal',
        'hasVideo': true,
      },
      {
        'imagePath': 'assets/images/woman-helping-man-gym (1) 2.png',
        'title': 'Lentil Soup',
        'duration': '30 Minutes',
        'calories': '200 Cal',
        'hasVideo': true,
      },
    ],
    'recipesForYou': [
      {
        'imagePath': 'assets/images/woman-helping-man-gym 4 (2).png',
        'title': 'Turkey And Avocado Wrap',
        'duration': '15 Minutes',
        'calories': '230 Cal',
        'hasVideo': false,
        'ingredients': '- Turkey slices\n- Avocado\n- Wrap',
        'preparation': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      },
      {
        'imagePath': 'assets/images/woman-helping-man-gym 1 (1).png',
        'title': 'Chicken Breast Stuffed With Spinach',
        'duration': '30 Minutes',
        'calories': '250 Cal',
        'hasVideo': false,
        'ingredients': '- Chicken breast\n- Spinach\n- Feta cheese',
        'preparation': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      },
    ],
  };

  final Map<String, dynamic> _dinnerData = {
    'recipeOfTheDay': {
      'imagePath': 'assets/images/woman-helping-man-gym 2 (1).png',
      'title': 'Teriyaki Chicken With Brown Rice',
      'duration': '45 Minutes',
      'calories': '375 Cal',
      'hasVideo': false,
      'ingredients': '- Chicken\n- Teriyaki sauce\n- Brown rice',
      'preparation': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    'recommended': [
      {
        'imagePath': 'assets/images/woman-helping-man-gym 2 (2).png',
        'title': 'Quinoa Salad',
        'duration': '25 Minutes',
        'calories': '300 Cal',
        'hasVideo': true,
      },
      {
        'imagePath': 'assets/images/woman-helping-man-gym 2 (1).png',
        'title': 'Burrito With Vegetables',
        'duration': '20 Minutes',
        'calories': '250 Cal',
        'hasVideo': true,
      },
    ],
    'recipesForYou': [
      {
        'imagePath': 'assets/images/woman-helping-man-gym 3 (1).png',
        'title': 'Baked Salmon',
        'duration': '30 Minutes',
        'calories': '350 Cal',
        'hasVideo': false,
        'ingredients': '- Salmon fillet\n- Asparagus\n- Lemon',
        'preparation': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      },
      {
        'imagePath': 'assets/images/woman-helping-man-gym 2 (2).png',
        'title': 'Chicken Breast Stuffed With Spinach',
        'duration': '30 Minutes',
        'calories': '250 Cal',
        'hasVideo': false,
        'ingredients': '- Chicken breast\n- Spinach\n- Feta cheese',
        'preparation': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      },
    ],
  };

  Map<String, dynamic> get _currentMealData {
    if (selectedMealCategory == 'Lunch') {
      return _lunchData;
    } else if (selectedMealCategory == 'Dinner') {
      return _dinnerData;
    } else {
      return _breakfastData;
    }
  }

  void _navigateToDetailScreen(Map<String, dynamic> recipe) {
    if (recipe['hasVideo'] ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NutritionVideoPlayerScreen(
            recipeTitle: recipe['title'],
            imagePath: recipe['imagePath'],
            duration: recipe['duration'],
            calories: recipe['calories'],
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetailScreen(
            imagePath: recipe['imagePath'],
            title: recipe['title'],
            duration: recipe['duration'],
            calories: recipe['calories'],
            ingredients: recipe['ingredients'],
            preparation: recipe['preparation'],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentData = _currentMealData;
    final recipeOfTheDay = currentData['recipeOfTheDay'];
    final recommendedRecipes = currentData['recommended'];
    final recipesForYou = currentData['recipesForYou'];

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Meal category chips (Breakfast, Lunch, Dinner)
              Row(
                children: [
                  Expanded(
                    child: MealIdeaCategoryChip(
                      text: 'Breakfast',
                      isSelected: selectedMealCategory == 'Breakfast',
                      onTap: () {
                        setState(() {
                          selectedMealCategory = 'Breakfast';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MealIdeaCategoryChip(
                      text: 'Lunch',
                      isSelected: selectedMealCategory == 'Lunch',
                      onTap: () {
                        setState(() {
                          selectedMealCategory = 'Lunch';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MealIdeaCategoryChip(
                      text: 'Dinner',
                      isSelected: selectedMealCategory == 'Dinner',
                      onTap: () {
                        setState(() {
                          selectedMealCategory = 'Dinner';
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Recipe of the Day
              RecipeOfTheDayCard(
                imagePath: recipeOfTheDay['imagePath'],
                title: recipeOfTheDay['title'],
                duration: recipeOfTheDay['duration'],
                calories: recipeOfTheDay['calories'],
                onTap: () => _navigateToDetailScreen(recipeOfTheDay),
              ),
              const SizedBox(height: 20),

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
                padding:AppPadding.pageHorizontal,
                child: SizedBox(
                  height: 175, // Fixed height for horizontal list
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recommendedRecipes[index];
                      return Padding(
                        padding: EdgeInsets.only(right: index == recommendedRecipes.length - 1 ? 0 : 15),
                        child: RecommendedRecipeCard(
                          imagePath: recipe['imagePath'],
                          title: recipe['title'],
                          duration: recipe['duration'],
                          calories: recipe['calories'],
                          hasVideo: recipe['hasVideo'],
                          onTap: () => _navigateToDetailScreen(recipe),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Recipes For You Section
              Padding(
                padding: AppPadding.pageHorizontal,
                child: TitleText(
                  text: 'Recipes For You',
                  color: AppColors.yellow,
                  fontSize: 20,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10),
              ...recipesForYou.map<Widget>((recipe) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 25,right: 25),
                  child: RecipesForYouCard(
                    imagePath: recipe['imagePath'],
                    title: recipe['title'],
                    duration: recipe['duration'],
                    calories: recipe['calories'],
                    onTap: () => _navigateToDetailScreen(recipe),
                  ),
                );
              }).toList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}