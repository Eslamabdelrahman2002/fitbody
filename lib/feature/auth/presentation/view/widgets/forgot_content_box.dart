import 'package:flutter/material.dart';

import '../../../../../core/costant/app_padding.dart';
import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';
import '../../../../../core/widgets/my_text_field.dart';

class ForgotContentBox extends StatelessWidget {
  const ForgotContentBox({super.key});

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
          ParagraphText(text: 'Enter your email address',color: AppColors.black,),
          SizedBox(height: 8,),
          MyTextField(obscureText: false,),

        ],
      ),
    );
  }
}
