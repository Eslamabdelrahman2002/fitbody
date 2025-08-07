import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  final String screenTitle;
  const AppBarScreen({super.key,required this.screenTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Icon(Icons.arrow_left,color: AppColors.yellow,size: 22),
          ),
        ),
        Spacer(),
        ScreenTitleText( text: screenTitle,color: AppColors.yellow,),
        Spacer()
      ],
    );
  }
}
