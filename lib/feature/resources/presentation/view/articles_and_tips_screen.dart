// articles_and_tips_screen.dart
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/resources/presentation/view/widgets/article_list_item.dart';
import 'package:fitness_app/feature/resources/presentation/view/article_detail_screen.dart';

class ArticlesAndTipsScreen extends StatelessWidget {
  const ArticlesAndTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ArticleListItem(
          imagePath: 'assets/images/woman-helping-man-gym (1) 2 (1).png',
          title: 'Strength Training Tips',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ArticleDetailScreen()));
          },
        ),
        ArticleListItem(
          imagePath: 'assets/images/woman-helping-man-gym (1) 3.png',
          title: 'Healthy Weight Loss',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
          onTap: () {},
        ),
        ArticleListItem(
          imagePath: 'assets/images/woman-helping-man-gym (1) 3 (1).png',
          title: 'Unlock Your Gym Potential',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
          onTap: () {},
        ),
        ArticleListItem(
          imagePath: 'assets/images/woman-helping-man-gym (1) 4.png',
          title: 'From Beginner To Buff',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
          onTap: () {},
        ),
        ArticleListItem(
          imagePath: 'assets/images/woman-helping-man-gym (1) 4 (1).png',
          title: 'Strategies For Gym Success',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
          onTap: () {},
        ),
      ],
    );
  }
}