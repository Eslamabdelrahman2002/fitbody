import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/profile/presentation/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteAppBar extends StatelessWidget {
  const FavoriteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: ()=>Navigator.of(context).pop(),
            child: FaIcon(Icons.arrow_left,size: 25,color: AppColors.yellow,)),
        TitleText(text: 'Favorites',color: AppColors.purple,),
        Spacer(),
        IconButton(
            onPressed: ()
            {},
            icon: FaIcon(
              Icons.search_sharp,
              size:25 ,),
            color: AppColors.purple),
        IconButton(
            onPressed: ()
            {},
            icon: FaIcon(
              Icons.notifications,
              size:25 ,),
            color: AppColors.purple),

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
    );
  }
}
