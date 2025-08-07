import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginContentBox extends StatelessWidget {
  const LoginContentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: AppPadding.contentBox,
      decoration: BoxDecoration(
        color: AppColors.purpleLight
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ParagraphText(text: 'Username or email',color: AppColors.black,),
          SizedBox(height: 8,),
          MyTextField(obscureText: false,),
          SizedBox(height: 20,),
          ParagraphText(text: 'Password',color: AppColors.black,),
          SizedBox(height: 8,),
          MyTextField(obscureText: true,)
        ],
      ),
    );
  }
}
