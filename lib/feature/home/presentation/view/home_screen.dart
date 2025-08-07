import 'package:fitness_app/feature/community/presentation/view/community_screen.dart';
import 'package:fitness_app/feature/favorite/presentation/view/favorites_screen.dart';
import 'package:fitness_app/feature/help/presentation/view/help_faqs_screen.dart';
import 'package:fitness_app/feature/home/presentation/view/widgets/weekly_challenge_card.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/nutrition_screen.dart';
import 'package:fitness_app/feature/recommendations/presentation/view/recommendations_screen.dart';
import 'package:fitness_app/feature/weekly_challenge/presentation/view/weekly_challenge_intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/feature/home/presentation/view/widgets/home_app_bar.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/home/presentation/view/widgets/category_icon_button.dart';
import 'package:fitness_app/feature/home/presentation/view/widgets/recommendation_card.dart';
import 'package:fitness_app/feature/home/presentation/view/widgets/article_tip_card.dart';
import 'package:fitness_app/feature/home/presentation/view/widgets/bottom_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitness_app/feature/workout/presentation/view/workout_screen.dart';
import 'package:fitness_app/feature/progress_tracking/presentation/view/progress_tracking_screen.dart';
import 'package:fitness_app/feature/recommendations/presentation/view/exercise_detail_screen.dart';
import 'package:fitness_app/feature/resources/presentation/view/resources_screen.dart';
import 'package:fitness_app/feature/profile/presentation/view/profile.dart'; // Assuming this is the profile screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedCategoryIndex = 0;

  final List<Widget> _screens = [
    _MainHomeScreenContent(
      onCategoryIconTapped: (index) {},
      selectedCategoryIndex: 0,
      recommendations: [],
      buildVerticalDivider: () => Container(),
    ), // This is a placeholder that will be replaced in the build method.
    const ResourcesScreen(),
    const RecommendationsScreen(),
    Container(color: Colors.blue), // Placeholder for the 4th icon
    Container(color: Colors.green), // Placeholder for the 5th icon
  ];

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategoryIconTapped(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  // Data list for the recommendations
  final List<Map<String, String>> recommendations = [
    {
      'imagePath': 'assets/images/woman-helping-man-gym 1.png',
      'title': 'Squat Exercise',
      'duration': '12 Minutes',
      'calories': '120 Kcal',
      'difficulty': 'Medium',
    },
    {
      'imagePath': 'assets/images/woman-helping-man-gym 2.png',
      'title': 'Full Body Stretching',
      'duration': '12 Minutes',
      'calories': '120 Kcal',
      'difficulty': 'Easy',
    },
    {
      'imagePath': 'assets/images/woman-helping-man-gym 3.png',
      'title': 'Circuit Training',
      'duration': '60 Minutes',
      'calories': '1000 Kcal',
      'difficulty': 'Hard',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _MainHomeScreenContent(
              onCategoryIconTapped: _onCategoryIconTapped,
              selectedCategoryIndex: _selectedCategoryIndex,
              recommendations: recommendations,
              buildVerticalDivider: _buildVerticalDivider,
            ),
            const ResourcesScreen(),
            const FavoritesScreen(),
            // Assuming the 4th and 5th items are for community and profile
            const HelpFaqsScreen(),
            const MyProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onBottomNavItemTapped,
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 60,
      width: 1,
      color: AppColors.purple,
      margin: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}

// A new widget to encapsulate the main home screen's content.
class _MainHomeScreenContent extends StatelessWidget {
  final Function(int) onCategoryIconTapped;
  final int selectedCategoryIndex;
  final List<Map<String, String>> recommendations;
  final Widget Function() buildVerticalDivider;

  const _MainHomeScreenContent({
    Key? key,
    required this.onCategoryIconTapped,
    required this.selectedCategoryIndex,
    required this.recommendations,
    required this.buildVerticalDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const HomeAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Category Icons with Dividers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryIconButton(
                      icon: Icons.fitness_center_outlined,
                      text: 'Workout',
                      onTap: () {
                        onCategoryIconTapped(0);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WorkoutScreen()),
                        );
                      },
                      isSelected: selectedCategoryIndex == 0,
                    ),
                    buildVerticalDivider(),
                    CategoryIconButton(
                      icon: Icons.file_copy_outlined,
                      text: 'Progress Tracking',
                      onTap: () {
                        onCategoryIconTapped(1);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProgressTrackingScreen()),
                        );
                      },
                      isSelected: selectedCategoryIndex == 1,
                    ),
                    buildVerticalDivider(),
                    CategoryIconButton(
                      icon: Icons.apple_sharp,
                      text: 'Nutrition',
                      onTap: () {
                        onCategoryIconTapped(2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NutritionScreen()),
                        );
                      },
                      isSelected: selectedCategoryIndex == 2,
                    ),
                    buildVerticalDivider(),
                    CategoryIconButton(
                      icon: Icons.people_outline_rounded,
                      text: 'Community',
                      onTap: () {
                        onCategoryIconTapped(3);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CommunityScreen()),
                        );
                      },
                      isSelected: selectedCategoryIndex == 3,
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Recommendations Section
                Padding(
                  padding: AppPadding.pageHorizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubtitleText(
                        text: 'Recommendations',
                        color: AppColors.yellow,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const RecommendationsScreen()));
                        },
                        child: const Row(
                          children: [
                            ParagraphText(
                              text: 'See All',
                              color: AppColors.white,
                              fontSize: 14,
                              textAlign: TextAlign.right,
                            ),
                            FaIcon(Icons.arrow_right, color: AppColors.yellow, size: 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 210,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendations.length,
                      itemBuilder: (context, index) {
                        final exercise = recommendations[index];
                        return RecommendationCard(
                          imagePath: exercise['imagePath']!,
                          title: exercise['title']!,
                          duration: exercise['duration']!,
                          calories: exercise['calories']!,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExerciseDetailScreen(
                                  title: exercise['title']!,
                                  difficulty: exercise['difficulty']!,
                                  imagePath: exercise['imagePath']!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Weekly Challenge Card
                WeeklyChallengeCard(
                  imagePath: 'assets/images/woman-helping-man-gym (1) 4.png',
                  challengeTitle: 'Weekly Challenge',
                  challengeDescription: 'Plank With Hip Twist',
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>WeeklyChallengeIntroScreen())),
                ),

                // Articles & Tips Section
                const SizedBox(height: 20),
                Padding(
                  padding: AppPadding.pageHorizontal,
                  child: SubtitleText(
                    text: 'Articles & Tips',
                    color: AppColors.yellow,
                    fontSize: 18,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ArticleTipCard(
                        imagePath: 'assets/images/woman-helping-man-gym 1.png',
                        title: 'Supplement Guide...',
                        onTap: () {},
                      ),
                      const SizedBox(width: 15),
                      ArticleTipCard(
                        imagePath: 'assets/images/woman-helping-man-gym 2.png',
                        title: '15 Quick & Effective Daily Routines...',
                        onTap: () {},
                      ),
                      const SizedBox(width: 15),
                      ArticleTipCard(
                        imagePath: 'assets/images/woman-helping-man-gym 3.png',
                        title: 'Healthy Eating Tips...',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}