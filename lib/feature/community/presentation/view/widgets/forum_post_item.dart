import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class ForumPostItem extends StatelessWidget {
  final String userName;
  final String postText;
  final int likes;
  final int comments;
  final int shares;
  final VoidCallback onTap;

  const ForumPostItem({
    Key? key,
    required this.userName,
    required this.postText,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(AppRadius.contentBox),
        border: Border.all(color: AppColors.yellow)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  SubtitleText(
                    text: userName,
                    color: AppColors.white,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Icon(Icons.star_border, color: AppColors.white, size: 24),
            ],
          ),
          const SizedBox(height: 10),
          ParagraphText(
            text: postText,
            color: AppColors.white.withOpacity(0.7),
            textAlign: TextAlign.left,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetric(Icons.star, likes),
              _buildMetric(Icons.comment, comments),
              _buildMetric(Icons.share, shares),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(IconData icon, int count) {
    return Row(
      children: [
        Icon(icon, color: AppColors.purple, size: 16),
        const SizedBox(width: 5),
        ParagraphText(
          text: '$count',
          color: AppColors.white,
          fontSize: 12,
        ),
      ],
    );
  }
}