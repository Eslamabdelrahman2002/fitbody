import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/feature/auth/presentation/view/finger_print/finger_print_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(
          icon: FontAwesomeIcons.google,
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          icon: FontAwesomeIcons.facebook,
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          icon: FontAwesomeIcons.fingerprint,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FingerPrintScreen()));
          },
        ),
      ],
    );
  }

  Widget _buildSocialIcon({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      width: 50,
      height: 50,

      decoration: BoxDecoration(
         color: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(color:AppColors.white),
      ),
      child: IconButton(
        icon: FaIcon(icon, color: AppColors.purpleLight,size: 25,),
        onPressed: onPressed,
      ),
    );
  }
}
