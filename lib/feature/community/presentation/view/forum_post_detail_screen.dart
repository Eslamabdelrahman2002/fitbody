import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/community/presentation/view/widgets/forum_post_item.dart';

class ForumPostDetailScreen extends StatelessWidget {
  final String userName;
  final String postText;
  final int likes;
  final int comments;
  final int shares;

  const ForumPostDetailScreen({
    Key? key,
    required this.userName,
    required this.postText,
    required this.likes,
    required this.comments,
    required this.shares,
  }) : super(key: key);

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
              const SizedBox(height: 20),

              // Display the single forum post using the same widget
              ForumPostItem(
                userName: userName,
                postText: postText,
                likes: likes,
                comments: comments,
                shares: shares,
                onTap: () {}, // No action needed as this is the detail screen
              ),

              // You can add more comments or a reply section here
            ],
          ),
        ),
      ),
    );
  }
}