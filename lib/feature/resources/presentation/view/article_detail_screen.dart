import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({super.key});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header section with title, publish date, and favorite icon
              Padding(
                padding:AppPadding.pageHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TitleText(
                            text: 'Strength Training Tips',
                            color: AppColors.yellow,
                            fontSize: 24,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.star, color: _isFavorited ? AppColors.yellow : AppColors.white),
                          onPressed: _toggleFavorite,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: AppColors.purple, size: 14),
                        const SizedBox(width: 5),
                        ParagraphText(
                          text: 'Published on September 15',
                          color: AppColors.white.withOpacity(0.7),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Image Container
              Container(
                height: 300, // Adjusted height to match the image
                decoration: BoxDecoration(
                  color: AppColors.purpleLight, // Background color for the container
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.contentBox), // Clip image to match container's rounded corners
                    child: Image.asset(
                      'assets/images/woman-helping-man-gym (1) 2 (1).png', // Updated image path
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Content Section (description, plan, warm-up)
              Padding(
                padding:AppPadding.pageHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ParagraphText(
                      text: 'Discover essential Strength Training Tips to maximize your workouts and achieve your fitness goals efficiently. Learn how to optimize your routine, prevent injuries, and unlock your full potential in the gym.',
                      color: AppColors.white.withOpacity(0.7),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    TitleText(
                      text: 'Plan Your Routine:',
                      color: AppColors.yellow,
                      fontSize: 20,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    ParagraphText(
                      text: 'Before starting any workout, plan your routine for the week. Focus on different muscle groups on different days to allow for adequate rest and recovery.',
                      color: AppColors.white.withOpacity(0.7),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    TitleText(
                      text: 'Warm-Up:',
                      color: AppColors.yellow,
                      fontSize: 20,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    ParagraphText(
                      text: 'Begin your workout with a proper warm-up session. This could include light cardio exercises like jogging or jumping jacks, as well as dynamic stretches to prepare your muscles for the upcoming workout.',
                      color: AppColors.white.withOpacity(0.7),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Add some space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
