import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/community/presentation/view/widgets/community_tab_button.dart';
import 'package:fitness_app/feature/community/presentation/view/widgets/featured_challenge_card.dart';
import 'package:fitness_app/feature/community/presentation/view/widgets/forum_list_item.dart';
import 'package:fitness_app/feature/community/presentation/view/challenges_and_competitions_screen.dart';
import 'package:fitness_app/feature/community/presentation/view/discussion_forum_screen.dart';
import 'package:fitness_app/feature/community/presentation/view/challenge_detail_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  String selectedTab = 'Discussion Forum';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildAppBar(context),
            const SizedBox(height: 20),
            Padding(
              padding: AppPadding.pageHorizontal,
              child: Row(
                children: [
                  Expanded(
                    child: CommunityTabButton(
                      text: 'Discussion Forum',
                      isSelected: selectedTab == 'Discussion Forum',
                      onTap: () {
                        setState(() {
                          selectedTab = 'Discussion Forum';
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CommunityTabButton(
                      text: 'Challenges',
                      isSelected: selectedTab == 'Challenges',
                      onTap: () {
                        setState(() {
                          selectedTab = 'Challenges';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (selectedTab == 'Discussion Forum')
                      _buildDiscussionForumContent(context)
                    else
                    // Wrap ChallengesAndCompetitionsScreen in a SizedBox to constrain its height
                      SizedBox(
                        height: MediaQuery.of(context).size.height, // You can adjust this to a specific value or a calculated height
                        child: _buildChallengesContent(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: AppPadding.pageHorizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_left, color: AppColors.yellow, size: 25),
          ),
          const ScreenTitleText(
            text: 'Community',
            color: AppColors.purple,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildDiscussionForumContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FeaturedChallengeCard(
          imagePath: 'assets/images/woman-helping-man-gym (1) 1 (2).png',
          title: 'Cycling Challenge',
          duration: '15 Minutes',
          calories: '100 Kcal',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChallengeDetailScreen()),
            );
          },
        ),
        const SizedBox(height: 20),
        Padding(
          padding:AppPadding.pageHorizontal,
          child: TitleText(
            text: 'Forums',
            color: AppColors.yellow,
            fontSize: 20,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 10),
        ForumListItem(
          title: 'Strength Training Techniques',
          description: 'Discussion on training methods',
          date: 'Today 17:05',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DiscussionForumScreen()),
            );
          },
        ),
        ForumListItem(
          title: 'Nutrition and Diet Strategies',
          description: 'Meal planning, supplementation preferences',
          date: 'Today 17:05',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DiscussionForumScreen()),
            );
          },
        ),
        ForumListItem(
          title: 'Cardiovascular Fitness',
          description: 'About different types of cardio workouts',
          date: 'Today 17:05',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DiscussionForumScreen()),
            );
          },
        ),
        ForumListItem(
          title: 'Strength Training Techniques',
          description: 'Strategies for improving flexibility and joint mobility to prevent injuries',
          date: 'Today 17:05',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DiscussionForumScreen()),
            );
          },
          isSpecial: true,
        ),
      ],
    );
  }

  Widget _buildChallengesContent() {
    return ChallengesAndCompetitionsScreen();
  }
}