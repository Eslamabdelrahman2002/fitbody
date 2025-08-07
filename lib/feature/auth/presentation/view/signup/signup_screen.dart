import 'package:flutter/material.dart';

import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import '../widgets/nav_login.dart';

import '../widgets/signup_content_box.dart';
import '../widgets/social_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarScreen(screenTitle: 'Create Account'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 65),
                    Center(child: ScreenTitleText(text: 'let\'s start!',color: AppColors.white,)),
                    SizedBox(height: 35),
                    SignupContentBox(),
                    SizedBox(height: 8,),

                    SizedBox(height: 20,),
                    Button(onButtonPressed: (){}, buttonText: "Sign Up", padding: 70,),
                    Align(
                        alignment: Alignment.center,
                        child:
                        ParagraphText(
                          text: 'or sign up with',
                          color: AppColors.white,)
                    ),
                    SizedBox(height: 19,),
                    SocialButtons(),
                    SizedBox(height: 48,),
                    NavLogin()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
