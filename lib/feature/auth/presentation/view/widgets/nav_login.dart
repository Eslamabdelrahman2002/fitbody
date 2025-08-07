import 'package:fitness_app/feature/auth/presentation/view/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';

class NavLogin extends StatelessWidget {
  const NavLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ParagraphText(text: 'Already have an account?',color: AppColors.white,),
        TextButton(onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }, child: ParagraphText(text: ' Log in',color: AppColors.yellow,))
      ],
    );
  }
}
