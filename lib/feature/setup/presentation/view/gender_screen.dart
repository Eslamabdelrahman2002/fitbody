import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/auth/presentation/view/widgets/button.dart';
import 'package:fitness_app/feature/setup/presentation/view/old_screen.dart' hide ParagraphText, TitleText;
import 'package:fitness_app/feature/setup/presentation/view/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/costant/app_padding.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const BackButtonScreen(),
            const SizedBox(height: 36),
            Center(
              child: TitleText(
                text: 'What’s Your Gender',
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 33),
            Container(
              width: double.infinity,
              padding: AppPadding.skipButton,
              color: AppColors.purpleLight,
              child: const
              ParagraphText(
                text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ',
              ),
            ),
            const SizedBox(height: 46),

            // MALE
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'male';
                });
              },
              child: Container(
                padding: AppPadding.contentBox,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  borderRadius: BorderRadius.circular(100),
                  color: selectedGender == 'male'
                      ? AppColors.yellow
                      : AppColors.white.withOpacity(0.1),
                ),
                child: FaIcon(
                  Icons.male,
                  color: selectedGender == 'male'
                      ? AppColors.black
                      : AppColors.white,
                  size: 100,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const SubtitleText(text: 'Male', color: AppColors.white),
            const SizedBox(height: 25),

            // FEMALE
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'female';
                });
              },
              child: Container(
                padding: AppPadding.contentBox,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  borderRadius: BorderRadius.circular(100),
                  color: selectedGender == 'female'
                      ? AppColors.yellow
                      : AppColors.white.withOpacity(0.1),
                ),
                child: FaIcon(
                  Icons.female_outlined,
                  color: selectedGender == 'female'
                      ? AppColors.black
                      : AppColors.white,
                  size: 100,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const SubtitleText(text: 'Female', color: AppColors.white),
            const SizedBox(height: 47),

            // CONTINUE BUTTON
            Button(
              onButtonPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>OldScreen()));
              },
              buttonText: 'Continue',
              padding: 50,
            ),
          ],
        ),
      ),
    );
  }
}

