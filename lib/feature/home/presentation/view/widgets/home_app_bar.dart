import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/notification/presentation/view/notifications_screen.dart';
import 'package:fitness_app/feature/profile/presentation/view/profile.dart';
import 'package:fitness_app/feature/search/presentation/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.pageHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TitleText(text: 'hi, Eslam',color: AppColors.purple,),
              Spacer(),
              IconButton(
                  onPressed: ()
                  {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                  },
                  icon: FaIcon(
                Icons.search_sharp,
                    size:25 ,),
                  color: AppColors.purple),
              SizedBox(width: 5,),
              IconButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
                  },
                  icon: FaIcon(
                    Icons.notifications,
                    size:25 ,),
                  color: AppColors.purple),
              SizedBox(width: 5,),
              IconButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
                  },
                  icon: FaIcon(
                    Icons.person,
                    size:25 ,),
                  color: AppColors.purple),

            ],
          ),
          ParagraphText(
            text: 'It\'s time to challenge your limits.',
            color: AppColors.white,)
        ],
      ),
    );
  }
}
