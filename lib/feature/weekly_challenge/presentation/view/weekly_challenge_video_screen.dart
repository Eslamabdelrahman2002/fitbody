import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/feature/weekly_challenge/presentation/view/congratulations_screen.dart';

class WeeklyChallengeVideoScreen extends StatefulWidget {
  final String exerciseTitle;

  const WeeklyChallengeVideoScreen({
    Key? key,
    required this.exerciseTitle,
  }) : super(key: key);

  @override
  State<WeeklyChallengeVideoScreen> createState() =>
      _WeeklyChallengeVideoScreenState();
}

class _WeeklyChallengeVideoScreenState
    extends State<WeeklyChallengeVideoScreen> {
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
            Padding(
              padding:AppPadding.pageHorizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_left, color: AppColors.yellow, size: 25),
                  ),
                  ScreenTitleText(
                    text:  widget.exerciseTitle,
                    color: AppColors.purple,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(color: AppColors.purpleLight),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(AppRadius.contentBox),
                      child: Image.asset(
                        'assets/images/woman-working-out-gym-2 1.png',
                        height: 500,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(AppRadius.contentBox),
                        color: AppColors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: AppColors.purpleLight,
                        size: 80,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 40,
                    child: GestureDetector(
                      onTap: _toggleFavorite,
                      child: Icon(
                        Icons.star,
                        color: _isFavorited
                            ? AppColors.yellow
                            : AppColors.white.withOpacity(.7),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content Section
            Expanded(
              child: SingleChildScrollView(
                padding: AppPadding.pageHorizontal.copyWith(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Yellow Info Box
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius:
                        BorderRadius.circular(AppRadius.contentBox),
                      ),
                      child: Column(
                        children: [
                          TitleText(
                            text: widget.exerciseTitle,
                            color: AppColors.black,
                            fontSize: 20,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          ParagraphText(
                            text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed cursus libero eget.',
                            color: AppColors.black.withOpacity(0.8),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),

                          // Stats Row
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.access_time,
                                        color: AppColors.black, size: 14),
                                    const SizedBox(width: 5),
                                    ParagraphText(
                                        text: '12 Minutes',
                                        color: AppColors.black,
                                        fontSize: 12),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                        Icons.local_fire_department_outlined,
                                        color: AppColors.black,
                                        size: 14),
                                    const SizedBox(width: 5),
                                    ParagraphText(
                                        text: '3 Rep',
                                        color: AppColors.black,
                                        fontSize: 12),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.directions_run,
                                        color: AppColors.black, size: 14),
                                    const SizedBox(width: 5),
                                    ParagraphText(
                                        text: 'Beginner',
                                        color: AppColors.black,
                                        fontSize: 12),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                        ],
                      ),
                    ),
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
