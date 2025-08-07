import 'package:fitness_app/feature/auth/presentation/view/set_password/set_password_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import '../widgets/forgot_content_box.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarScreen(screenTitle: 'Forgotten Password'),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 65),
                  Center(child: ScreenTitleText(text: 'Forgot Password?',color: AppColors.white,)),
                  SizedBox(height: 26,),
                  ParagraphText(text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ",color: AppColors.white,),
                  SizedBox(height: 70),
                  ForgotContentBox(),
                  SizedBox(height: 20,),
                  Button(onButtonPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SetPasswordScreen()));
                  }, buttonText: "Continue", padding: 50,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
