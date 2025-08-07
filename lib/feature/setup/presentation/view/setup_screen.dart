import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/auth/presentation/view/widgets/button.dart';
import 'package:fitness_app/feature/setup/presentation/view/gender_screen.dart';
import 'package:flutter/material.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Image.asset('assets/images/beautiful-young.png',
            height: 463,fit: BoxFit.cover,
            width: double.infinity,),
          SizedBox(height: 32,),
          TitleText(text: 'Consistency Is \n the Key To progress.\nDon\'t Give Up!',color: AppColors.yellow,),
          SizedBox(height: 33,),
          Container(
            width: double.infinity,
            padding: AppPadding.contentBox,
            color: AppColors.purpleLight,
            child: ParagraphText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. '),
          ),
          SizedBox(height: 42,),
          Button(onButtonPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>GenderScreen()));
          }
              , buttonText: 'Next', padding: 70)
        ],
      ),
    );
  }
}
