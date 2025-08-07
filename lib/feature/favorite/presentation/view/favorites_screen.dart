import 'package:fitness_app/feature/favorite/presentation/view/widgets/category_tab_button.dart';
import 'package:fitness_app/feature/favorite/presentation/view/widgets/favorite_app_bar.dart';
import 'package:fitness_app/feature/favorite/presentation/view/widgets/favorite_item_card.dart';
import 'package:fitness_app/feature/favorite/presentation/view/widgets/sort_by_chip.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String selectedCategory = 'All'; // State for selected category tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageHorizontal,
          child: Column(
            children: [
              const SizedBox(height: 10),
              // App Bar with Title and Icons
              FavoriteAppBar(),
              const SizedBox(height: 20),

              // Sort By and Category Tabs
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ParagraphText(text: 'Sort by',color: AppColors.yellow,),
                  SizedBox(width: 20,),
                  CategoryTabButton(
                    text: 'All',
                    isSelected: selectedCategory == 'All',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'All';
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  CategoryTabButton(
                    text: 'Video',
                    isSelected: selectedCategory == 'Video',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Video';
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  CategoryTabButton(
                    text: 'Article',
                    isSelected: selectedCategory == 'Article',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Article';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Content List (using Expanded to take remaining space)
              Expanded(
                child: ListView(
                  children: [
                    if (selectedCategory == 'All' || selectedCategory == 'Video')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 1.png', // You'll need to add this image
                        title: 'Upper Body',
                        type: 'video',
                        duration: '60 Minutes',
                        calories: '1200 Kcal',
                        exercises: '5 Exercises',
                        description: null,
                      ),
                    if (selectedCategory == 'All' || selectedCategory == 'Article')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 2.png', // You'll need to add this image
                        title: 'Boost Energy And Vitality',
                        type: 'article',
                        description: 'Incorporating physical exercise into your daily routine can boost...',
                      ),
                    if (selectedCategory == 'All' || selectedCategory == 'Video')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 3.png', // You'll need to add this image
                        title: 'Pull Out',
                        type: 'video',
                        duration: '30 Minutes',
                        calories: '1210 Kcal',
                        exercises: '10 Exercises',
                        description: null,
                      ),
                    if (selectedCategory == 'All' || selectedCategory == 'Video')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 4.png', // You'll need to add this image
                        title: 'Loop Band Exercises',
                        type: 'video',
                        duration: '45 Minutes',
                        calories: '785 Kcal',
                        exercises: '5 Exercises',
                        description: null,
                      ),
                    if (selectedCategory == 'All' || selectedCategory == 'Video')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 1.png', // You'll need to add this image
                        title: 'Dumbbell Step Up',
                        type: 'video',
                        duration: '42 Minutes',
                        calories: '1365 Kcal',
                        exercises: '11 Exercises',
                        description: null,
                      ),
                    if (selectedCategory == 'All' || selectedCategory == 'Video')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 2.png', // You'll need to add this image
                        title: 'Split Strength Training',
                        type: 'video',
                        duration: '12 Minutes',
                        calories: '1250 Kcal',
                        exercises: '5 Exercises',
                        description: null,
                      ),
                    if (selectedCategory == 'All' || selectedCategory == 'Video')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 3.png', // You'll need to add this image
                        title: 'Lower Body Blast',
                        type: 'video',
                        duration: '30 Minutes',
                        calories: '1210 Kcal',
                        exercises: '10 Exercises',
                        description: null,
                      ),
                    if (selectedCategory == 'All' || selectedCategory == 'Article')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 4.png', // You'll need to add this image
                        title: 'Avocado And Egg Toast',
                        type: 'article',
                        description: 'Avocado, eggs, and toast are staples for a delicious and nutritious...',
                      ),
                    if (selectedCategory == 'All' || selectedCategory == 'Article')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 1.png', // You'll need to add this image
                        title: 'Fruit Smoothie',
                        type: 'article',
                        description: 'A refreshing and healthy fruit smoothie made with fresh fruits...',
                      ),
                    if (selectedCategory == 'All' || selectedCategory == 'Article')
                      FavoriteItemCard(
                        imagePath: 'assets/images/woman-helping-man-gym 2.png', // You'll need to add this image
                        title: 'Hydrate Properly',
                        type: 'article',
                        description: 'Stay hydrated before, during, and after your workouts to optimize...',
                      ),
                  ].expand((widget) => [widget, const SizedBox(height: 15)]).toList(), // Add spacing between cards
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}