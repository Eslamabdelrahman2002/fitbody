import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/feature/edit_profile/presentation/view/widgets/edit_profile_picture.dart';
import 'package:flutter/material.dart';

import '../../../../core/costant/text.dart';
import '../../../../core/widgets/my_text_field.dart';
import '../../../profile/presentation/view/widgets/profile_back_button.dart';
import '../../../profile/presentation/view/widgets/profile_details_card.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(height: 460,
        
            child: Stack(
        children: [
          Container(
            color: AppColors.purpleLight,
            height: 420,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                ProfileBackButton(),
                const SizedBox(height: 30),
                const EditProfilePicture(), // Your existing profile picture widget
                const SizedBox(height: 10),
                TitleText(
                  text: 'Madison Smith', // Name
                  color: AppColors.white,
                ),
                SubtitleText(
                  text: 'madisons@example.com', // Email
                  color: AppColors.white,
                ),
                const SizedBox(height: 5),
                SubtitleText(
                  text: 'Birthday: April 1st', // Birthday
                  color: AppColors.white,
                ), // Pushes the bottom card to the bottom
        
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: const ProfileDetailCard()),
        ],
            ),
        
          ),
          SizedBox(height:48 ,),
          Padding(
            padding: AppPadding.pageHorizontal,
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
            ),
          ),
          Container(
            padding: AppPadding.buttonVertical,
            child: ElevatedButton(
              onPressed: (){
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
                  text: 'Update Profile',
                  color: AppColors.black,
                ),
              ),
            ),
          )
        ],
        ),
      ),
    );
  }
}
