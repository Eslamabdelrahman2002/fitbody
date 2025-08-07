import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/auth/presentation/view/forgot_password/forgot_password_screen.dart';
import 'package:fitness_app/feature/auth/presentation/view/widgets/app_bar.dart';
import 'package:fitness_app/feature/auth/presentation/view/widgets/button.dart';
import 'package:fitness_app/feature/auth/presentation/view/widgets/login_content_box.dart';
import 'package:fitness_app/feature/auth/presentation/view/widgets/nav_signup.dart';
import 'package:fitness_app/feature/auth/presentation/view/widgets/social_buttons.dart';
import 'package:fitness_app/feature/setup/presentation/view/setup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarScreen(screenTitle: 'Log In'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 65),
                    Center(child: ScreenTitleText(text: 'Welcome',color: AppColors.white,)),
                    SizedBox(height: 26,),
                    ParagraphText(text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ",color: AppColors.white,),
                    SizedBox(height: 70),
                    LoginContentBox(),
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: ParagraphText(text: 'Forgot Password?',color: AppColors.yellow,)),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Button(onButtonPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SetupScreen()));
                    }, buttonText: "Log In", padding: 70,),
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
                    NavSignup()
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
