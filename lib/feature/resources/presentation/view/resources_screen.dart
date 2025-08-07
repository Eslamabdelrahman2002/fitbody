// resources_screen.dart
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/resources/presentation/view/widgets/resources_tab_button.dart';
import 'package:fitness_app/feature/resources/presentation/view/workout_videos_screen.dart';
import 'package:fitness_app/feature/resources/presentation/view/articles_and_tips_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../profile/presentation/view/profile.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
              _buildAppBar(context),
              const SizedBox(height: 20),
              // Tabs
              Row(
                children: [
                  ResourcesTabButton(
                    text: 'Workout Videos',
                    isSelected: _currentIndex == 0,
                    onTap: () {
                      _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                  ),
                  const SizedBox(width: 8),
                  ResourcesTabButton(
                    text: 'Articles & Tips',
                    isSelected: _currentIndex == 1,
                    onTap: () {
                      _pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Content based on selected tab
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: const [
                    WorkoutVideosScreen(),
                    ArticlesAndTipsScreen(),
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
    return  Row(
      children: [
        GestureDetector(
            onTap: ()=>Navigator.of(context).pop(),
            child: FaIcon(Icons.arrow_left,size: 25,color: AppColors.yellow,)),
        TitleText(text: 'resources',color: AppColors.purple,),
        Spacer(),
        IconButton(
            onPressed: ()
            {},
            icon: FaIcon(
              Icons.search_sharp,
              size:25 ,),
            color: AppColors.purple),
        IconButton(
            onPressed: ()
            {},
            icon: FaIcon(
              Icons.notifications,
              size:25 ,),
            color: AppColors.purple),

        IconButton(
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
            },
            icon: FaIcon(
              Icons.person,
              size:25 ,),
            color: AppColors.purple),

      ],
    );
  }
}