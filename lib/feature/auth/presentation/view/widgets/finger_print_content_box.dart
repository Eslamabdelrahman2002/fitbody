import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/costant/app_padding.dart';
import '../../../../../core/costant/color.dart';

class FingerPrintContentBox extends StatelessWidget {
  const FingerPrintContentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: AppPadding.contentBox,
      decoration: BoxDecoration(
        color: AppColors.purpleLight,

      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 70),
          child: FaIcon(
            FontAwesomeIcons.fingerprint,
            size: MediaQuery.of(context).size.height*.2,

            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
