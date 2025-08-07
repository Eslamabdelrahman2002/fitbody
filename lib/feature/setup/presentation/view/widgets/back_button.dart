import 'package:flutter/material.dart';

import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';

class BackButtonScreen extends StatelessWidget {
  const BackButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Icon(Icons.arrow_left,color: AppColors.yellow,size: 22),
          ),
        ),SizedBox(width: 7,),
        ParagraphText( text: 'Back',color: AppColors.yellow,),

      ],
    );
  }
}
