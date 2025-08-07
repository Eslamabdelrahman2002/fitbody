import 'package:flutter/material.dart';

import '../../../../../core/costant/app_padding.dart';
import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';
import '../../../../../core/widgets/my_text_field.dart';

class SignupContentBox extends StatelessWidget {
  const SignupContentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.contentBox,
      decoration: BoxDecoration(
          color: AppColors.purpleLight
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ParagraphText(text: 'Full name',color: AppColors.black,),
          SizedBox(height: 8,),
          MyTextField(obscureText: false,),
          SizedBox(height: 20,),
          ParagraphText(text: 'Email or Mobile Number',color: AppColors.black,),
          SizedBox(height: 8,),
          MyTextField(obscureText: false,),
          SizedBox(height: 20,),
          ParagraphText(text: 'Password',color: AppColors.black,),
          SizedBox(height: 8,),
          MyTextField(obscureText: true,),
          SizedBox(height: 20,),
          ParagraphText(text: ' Confirm Password',color: AppColors.black,),
          SizedBox(height: 8,),
          MyTextField(obscureText: true,)
        ],
      ),
    );
  }
}
