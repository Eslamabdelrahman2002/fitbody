import 'package:flutter/material.dart';

import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';

class ProfileBackButton extends StatelessWidget {
  const ProfileBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Padding(
            padding: const EdgeInsets.only(left: 35),
            child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Icon(Icons.arrow_left,color: AppColors.yellow,size: 28)),
          ),
        SizedBox(width: 7,),
        TitleText( text: 'My Profile',color: AppColors.white,),

      ],
    );
  }
}
