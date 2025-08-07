import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/feature/home/presentation/view/home_screen.dart';
import 'package:fitness_app/feature/setup/presentation/view/widgets/back_button.dart';
import 'package:fitness_app/feature/setup/presentation/view/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

import '../../../../core/costant/app_padding.dart';
import '../../../../core/costant/text.dart';
import '../../../../core/widgets/my_text_field.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
          child:
          SingleChildScrollView(
            child: Column(
                    children: [
            const SizedBox(height: 15),
            const BackButtonScreen(),
            const SizedBox(height: 36),
            TitleText(
              text: 'Fill Your Profile',
              color: AppColors.white,
            ),
            const SizedBox(height: 31),
            ParagraphText(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ',
              color: AppColors.white,
            ),
            SizedBox(height: 20,),
            ProfilePictureWithEdit(),
                     Padding(
             padding: const EdgeInsets.all(36.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ParagraphText(text: 'Full name',color: AppColors.purple,),
                 SizedBox(height: 8,),
                 MyTextField(obscureText: false,),
                 SizedBox(height: 20,),
                 ParagraphText(text: 'Nickname',color: AppColors.purple,),
                 SizedBox(height: 8,),
                 MyTextField(obscureText: false,),
                 SizedBox(height: 20,),
                 ParagraphText(text: 'Email',color: AppColors.purple,),
                 SizedBox(height: 8,),
                 MyTextField(obscureText: false,),
                 SizedBox(height: 20,),
                 ParagraphText(text: ' Mobile Number',color:AppColors.purple,),
                 SizedBox(height: 8,),
                 MyTextField(obscureText: false,)
               ],
             ),),
                      Container(
                        padding: AppPadding.buttonVertical,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.yellow,
                            side: const BorderSide(color: Colors.white),
                            foregroundColor: AppColors.yellow,
                            padding: AppPadding.buttonVertical,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 5,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 70),
                            child: ButtonText(
                              text: 'Start',
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          )),
    );
  }
}
