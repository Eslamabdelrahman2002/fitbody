import 'package:fitness_app/feature/notification/presentation/view/notifications_screen.dart';
import 'package:fitness_app/feature/profile/presentation/view/profile.dart';
import 'package:fitness_app/feature/search/presentation/view/widgets/search_category_tab.dart';
import 'package:fitness_app/feature/search/presentation/view/widgets/search_result_card.dart';
import 'package:fitness_app/feature/search/presentation/view/widgets/top_search_item.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = 'All'; // State for selected category tab
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> searchResults = []; // To store dynamic search results
  List<Map<String, dynamic>> allContent = [
    // Sample data for 'All' search results
    {
      'type': 'workout',
      'imagePath': 'assets/images/woman-helping-man-gym 1.png', // You'll need to add this image
      'title': 'Squat Exercise',
      'duration': '12 Minutes',
      'calories': '120 Kcal',
      'exercises': null,
    },
    {
      'type': 'workout',
      'imagePath': 'assets/images/woman-helping-man-gym 2.png', // You'll need to add this image
      'title': 'Full Body Stretching',
      'duration': '12 Minutes',
      'calories': '120 Kcal',
      'exercises': null,
    },
    {
      'type': 'workout',
      'imagePath': 'assets/images/woman-helping-man-gym 3.png', // You'll need to add this image
      'title': 'Circuit Training',
      'duration': '60 Minutes',
      'calories': '1000 Kcal',
      'exercises': '5 Exercises',
    },
    {
      'type': 'nutrition',
      'imagePath': 'assets/images/woman-helping-man-gym 4.png', // You'll need to add this image
      'title': 'Delights With Greek Yogurt',
      'duration': '4 Minutes',
      'calories': '200 Cal',
      'exercises': null,
    },
    {
      'type': 'workout',
      'imagePath': 'assets/images/woman-helping-man-gym 1.png', // You'll need to add this image
      'title': 'Split Strength Training',
      'duration': '12 Minutes',
      'calories': '1250 Kcal',
      'exercises': '5 Exercises',
    },
    {
      'type': 'nutrition',
      'imagePath': 'assets/images/woman-helping-man-gym 2.png', // You'll need to add this image
      'title': 'Turkey And Avocado Wrap',
      'duration': '8 Minutes',
      'calories': '250 Cal',
      'exercises': null,
    },
  ];

  List<Map<String, dynamic>> workoutTopSearches = [
    // Sample data for Workout Top Searches
    {'text': 'Circuit'},
    {'text': 'Split'},
    {'text': 'Challenge'},
    {'text': 'Legs'},
    {'text': 'Cardio'},
  ];

  List<Map<String, dynamic>> nutritionTopSearches = [
    // Sample data for Nutrition Top Searches
    {'text': 'Breakfast'},
    {'text': 'Yogurt'},
    {'text': 'Vegetarian'},
    {'text': 'Smoothie'},
    {'text': 'Chicken'},
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_performSearch); // Listen for search input changes
  }

  @override
  void dispose() {
    _searchController.removeListener(_performSearch);
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    String query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        searchResults = []; // Clear results if search bar is empty
      });
      return;
    }

    setState(() {
      searchResults = allContent.where((item) {
        final title = item['title'].toLowerCase();
        final type = item['type'].toLowerCase();

        bool matchesQuery = title.contains(query);

        if (selectedCategory == 'All') {
          return matchesQuery;
        } else {
          return matchesQuery && type == selectedCategory;
        }
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
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
                    child: const FaIcon(
                      Icons.arrow_left_outlined,
                      color: AppColors.yellow,
                      size: 25,
                    ),
                  ),
                  const ScreenTitleText(
                    text: 'Search',
                    color: AppColors.purple,
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
                      }, icon: Icon(Icons.notifications,color: AppColors.purple,)),
                      SizedBox(width: 15),
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
                      }, icon: Icon(Icons.person,color: AppColors.purple,)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search Input Field
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: AppColors.black),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      border: InputBorder.none,
                    ),
                    cursorColor: AppColors.yellow,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Category Tabs
              Row(
                children: [
                  SearchCategoryTab(
                    text: 'All',
                    isSelected: selectedCategory == 'All',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'All';
                        _performSearch(); // Re-filter search results based on new category
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  SearchCategoryTab(
                    text: 'Workout',
                    isSelected: selectedCategory == 'Workout',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Workout';
                        _performSearch(); // Re-filter search results
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  SearchCategoryTab(
                    text: 'Nutrition',
                    isSelected: selectedCategory == 'Nutrition',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Nutrition';
                        _performSearch(); // Re-filter search results
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Expanded(
                child: _searchController.text.isEmpty
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubtitleText(
                      text: 'Top Searches',
                      color: AppColors.white,
                      textAlign: TextAlign.left,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: (selectedCategory == 'Workout'
                            ? workoutTopSearches
                            : selectedCategory == 'Nutrition'
                            ? nutritionTopSearches
                            : <Map<String, dynamic>>[]) // Explicitly type empty list
                            .map<Widget>((item) { // Explicitly cast map result to Widget
                          return TopSearchItem(text: item['text']!);
                        })
                            .expand((widgetItem) => [widgetItem, const SizedBox(height: 10)]) // Use a distinct variable name
                            .toList(),
                      ),
                    ),
                  ],
                )
                    : ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final item = searchResults[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0), // Spacing between cards
                      child: SearchResultCard(
                        imagePath: item['imagePath'],
                        title: item['title'],
                        type: item['type'],
                        duration: item['duration'],
                        calories: item['calories'],
                        exercises: item['exercises'],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}