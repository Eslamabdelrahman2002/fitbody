import 'package:fitness_app/feature/auth/presentation/view/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import '../widgets/set_password_content_box.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarScreen(screenTitle: 'Set Your Fingerprint'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 87 ),
                    ParagraphText(text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ",color: AppColors.white,),
                    SizedBox(height: 39),
                    SetPasswordContentBox(),
                    SizedBox(height: 20,),
                    Button(onButtonPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }, buttonText: "Reset Password", padding: 40,),

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
