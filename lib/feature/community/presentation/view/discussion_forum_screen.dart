import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/community/presentation/view/widgets/forum_post_item.dart';
import 'package:fitness_app/feature/community/presentation/view/widgets/community_tab_button.dart';
import 'package:fitness_app/feature/community/presentation/view/challenges_and_competitions_screen.dart';
  import 'package:fitness_app/feature/community/presentation/view/forum_post_detail_screen.dart';

class DiscussionForumScreen extends StatefulWidget {
  const DiscussionForumScreen({super.key});

  @override
  State<DiscussionForumScreen> createState() => _DiscussionForumScreenState();
}

class _DiscussionForumScreenState extends State<DiscussionForumScreen> {
  String selectedTab = 'Discussion Forum';

  final List<Map<String, dynamic>> _posts = [
    {
      'userName': 'Madison',
      'postText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor aenean suspendisse pretium nunc non facilisi.',
      'likes': 30254,
      'comments': 10254,
      'shares': 1254,
    },
    {
      'userName': 'Madison',
      'postText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor aenean suspendisse pretium nunc non facilisi.',
      'likes': 30254,
      'comments': 10254,
      'shares': 1254,
    },
    {
      'userName': 'Madison',
      'postText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor aenean suspendisse pretium nunc non facilisi.',
      'likes': 30254,
      'comments': 10254,
      'shares': 1254,
    },
    {
      'userName': 'Madison',
      'postText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor aenean suspendisse pretium nunc non facilisi.',
      'likes': 30254,
      'comments': 10254,
      'shares': 1254,
    },
  ];

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
              Row(
                children: [
                  GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: Icon(Icons.arrow_left,color: AppColors.yellow,size: 25,)),
                  TitleText(
                    text: 'Forums',
                    color: AppColors.purple,
                    fontSize: 20,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    final post = _posts[index];
                    return ForumPostItem(
                      userName: post['userName']!,
                      postText: post['postText']!,
                      likes: post['likes']!,
                      comments: post['comments']!,
                      shares: post['shares']!,
                      onTap: () {
                      },
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

  // Widget _buildAppBar(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       GestureDetector(
  //         onTap: () => Navigator.pop(context),
  //         child: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 20),
  //       ),
  //       const ScreenTitleText(
  //         text: 'Community',
  //         color: AppColors.white,
  //         textAlign: TextAlign.left,
  //       ),
  //       Row(
  //         children: [
  //           Icon(Icons.search, color: AppColors.white),
  //           SizedBox(width: 15),
  //           Icon(Icons.person, color: AppColors.white),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}