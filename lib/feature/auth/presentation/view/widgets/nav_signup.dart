import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/auth/presentation/view/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class NavSignup extends StatelessWidget {
  const NavSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ParagraphText(text: 'Don’t have an account?',color: AppColors.white,),
        TextButton(onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
        },
            child: ParagraphText(text: ' Sign Up',color: AppColors.yellow,))
      ],
    );
  }
}
