import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class ForumListItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final VoidCallback onTap;
  final bool isSpecial; // Added to handle the special styling of the last item

  const ForumListItem({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.onTap,
    this.isSpecial = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:AppPadding.pageHorizontal,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10), // Spacing between items
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(AppRadius.contentBox), // Rounded corners
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      text: title,
                      color: isSpecial ? AppColors.purpleLight : AppColors.white,
                      fontSize: 16,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 5),
                    isSpecial
                        ? RichText(
                      text: TextSpan(
                        text: description,
                        style: TextStyle(
                          color: AppColors.purpleLight,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                        : ParagraphText(
                      text: description,
                      color: AppColors.white.withOpacity(0.7),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ParagraphText(
                    text: 'See All',
                    color: AppColors.white,
                    fontSize: 12,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 5),
                  ParagraphText(
                    text: date,
                    color: AppColors.white.withOpacity(0.7),
                    fontSize: 12,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}