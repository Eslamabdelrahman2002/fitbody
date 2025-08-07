import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class ChallengeVideoScreen extends StatefulWidget {
  final String exerciseTitle;
  final String duration;
  final String difficulty;

  const ChallengeVideoScreen({
    Key? key,
    required this.exerciseTitle,
    required this.duration,
    required this.difficulty,
  }) : super(key: key);

  @override
  State<ChallengeVideoScreen> createState() => _ChallengeVideoScreenState();
}

class _ChallengeVideoScreenState extends State<ChallengeVideoScreen> {
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
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left, color: AppColors.yellow, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TitleText(
          text: 'Weekly Challenge',
          color: AppColors.purple,
          fontSize: 20,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
        Expanded(
          child: Container(
          decoration: BoxDecoration(
          color: AppColors.purpleLight,

          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(color: AppColors.purpleLight,height:350,width: double.infinity,),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.contentBox),top: Radius.circular(AppRadius.contentBox)),
                          child: Image.asset(
                           'assets/images/woman-helping-man-gym (1) 1 (2).png',
                            height:550,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.contentBox),top: Radius.circular(AppRadius.contentBox)),
                              color: AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Icon(
                            Icons.play_circle_fill,
                            color: AppColors.purpleLight,
                            size: 80,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
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
                ],
              ),
            ],
          ),
                ),
        ),
            SingleChildScrollView(
              padding: AppPadding.pageHorizontal.copyWith(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(AppRadius.contentBox),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(
                          text: widget.exerciseTitle,
                          color: AppColors.black,
                          fontSize: 20,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        ParagraphText(
                          text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed cursus libero eget.',
                          color: AppColors.black.withOpacity(0.8),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.access_time,
                                      color: AppColors.black, size: 14),
                                  const SizedBox(width: 5),
                                  ParagraphText(
                                      text: widget.duration,
                                      color: AppColors.black,
                                      fontSize: 12),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.local_fire_department,
                                      color: AppColors.black, size: 14),
                                  const SizedBox(width: 5),
                                  ParagraphText(
                                      text: 'High',
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
                                      text: widget.difficulty,
                                      color: AppColors.black,
                                      fontSize: 12),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
