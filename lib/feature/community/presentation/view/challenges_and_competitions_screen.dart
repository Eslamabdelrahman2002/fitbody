import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/community/presentation/view/widgets/challenge_list_item.dart';
import 'package:fitness_app/feature/community/presentation/view/challenge_detail_screen.dart';

class ChallengesAndCompetitionsScreen extends StatelessWidget {
  const ChallengesAndCompetitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return

      SafeArea(
        child: Padding(
          padding: AppPadding.pageHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TitleText(
                text: 'Challenges And Competitions',
                color: AppColors.yellow,
                fontSize: 20,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    ChallengeListItem(
                      imagePath: 'assets/images/woman-helping-man-gym (1) 1 (2).png',
                      title: 'Cycling Challenge',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      onTap: () {
                        // Navigate to the challenge detail screen
                      },
                    ),
                    ChallengeListItem(
                      imagePath: 'assets/images/woman-helping-man-gym (1) 1 (2).png',
                      title: 'Power Squat',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      onTap: () {},
                    ),
                    ChallengeListItem(
                      imagePath: 'assets/images/woman-helping-man-gym (1) 1 (2).png',
                      title: 'Press Leg Ultimate',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      onTap: () {},
                    ),
                    ChallengeListItem(
                      imagePath: 'assets/images/woman-helping-man-gym (1) 1 (2).png',
                      title: 'Cycling',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      onTap: () {},
                    ),
                    ChallengeListItem(
                      imagePath: 'assets/images/woman-helping-man-gym (1) 1 (2).png',
                      title: 'Cycling Challenge',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      onTap: () {
                        // Navigate to the challenge detail screen
                      },
                    ),
                    ChallengeListItem(
                      imagePath: 'assets/images/woman-helping-man-gym (1) 1 (2).png',
                      title: 'Power Squat',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      onTap: () {},
                    ),
                    ChallengeListItem(
                      imagePath: 'assets/images/woman-helping-man-gym (1) 1 (2).png',
                      title: 'Press Leg Ultimate',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      onTap: () {},
                    ),
                    ChallengeListItem(
                      imagePath: 'assets/images/woman-helping-man-gym (1) 1 (2).png',
                      title: 'Cycling',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      onTap: () {},
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