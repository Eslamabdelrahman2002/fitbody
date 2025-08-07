
import 'package:fitness_app/feature/auth/presentation/view/login/login_screen.dart';
import 'package:fitness_app/feature/onboarding/view/widgets/onboarding_page.dart';
import 'package:fitness_app/feature/onboarding/view/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/costant/app_durations.dart';
import '../../../core/costant/app_padding.dart';
import '../../../core/costant/app_radius.dart';
import '../../../core/costant/color.dart';
import '../../../core/costant/text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Data for each onboarding page
  final List<Map<String, dynamic>> onboardingData = [
    {
      'image': 'assets/images/onboarding1.png', // Placeholder image
      'title': 'Start Your Journey Towards A More Active Lifestyle',
      'buttonText': 'Next',
      'icon': Icons.directions_run,
    },
    {
      'image': 'assets/images/onboarding2.png', // Placeholder image
      'title': 'Find Nutrition Tips That Fit Your Lifestyle',
      'buttonText': 'Next',
      'icon': Icons.restaurant_menu,
    },
    {
      'image': 'assets/images/onboarding3.png', // Placeholder image
      'title': 'A Community For You, Challenge Yourself',
      'buttonText': 'Get Started',
      'icon': Icons.people,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updateCurrentPage);
  }

  void _updateCurrentPage() {
    setState(() {
      _currentPage = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateCurrentPage); // Important to remove listener
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToNextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: AppDurations.pageTransition,
        curve: Curves.easeIn,
      );
    } else if(_currentPage ==2){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
  }

  void _skipOnboarding() {
    // _pageController.jumpToPage(onboardingData.length - 1);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              final pageData = onboardingData[index];
              return OnboardingPage(
                imagePath: pageData['image']!,
                title: pageData['title']!,
                buttonText: pageData['buttonText']!,
                icon: pageData['icon']!,
                onButtonPressed: _navigateToNextPage,
                onSkipPressed: _skipOnboarding,
                currentPage: index, // Pass the current page index
                totalPages: onboardingData.length, // Pass the total number of pages
              );
            },
          ),
          // Removed the global PageIndicator as it's now internal to OnboardingContentBox
        ],
      ),
    );
  }
}










// Custom Text Widgets to match exact styles not fully covered by provided text.dart



