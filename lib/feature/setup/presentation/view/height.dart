import 'package:fitness_app/feature/setup/presentation/view/goals.dart';
import 'package:fitness_app/feature/setup/presentation/view/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../../core/costant/color.dart';
import '../../../../core/costant/text.dart';
import '../../../auth/presentation/view/widgets/button.dart';

class Height extends StatefulWidget {
  const Height({super.key});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  int _currentValue = 170;
  bool _cm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const BackButtonScreen(),
            const SizedBox(height: 36),
            TitleText(
              text: 'What Is Your height?',
              color: AppColors.white,
            ),
            const SizedBox(height: 31),
            ParagraphText(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ',
              color: AppColors.white,
            ),
            const SizedBox(height: 90),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_right,
                    color: AppColors.yellow,
                    size: 50,
                  ),
                  Container(
                    color: AppColors.purpleLight,
                    child: Center(
                      child: NumberPicker(
                        value: _currentValue,
                        minValue: 150,
                        maxValue: 220,
                        step: 1,
                        itemCount: 5,
                        axis: Axis.vertical,
                        haptics: true,
                        itemHeight: 90,
                        textStyle: GoogleFonts.poppins(
                          fontSize: 22,
                          color: AppColors.purple,
                        ),
                        selectedTextStyle: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                        onChanged: (value) => setState(() => _currentValue = value),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$_currentValue',
                        style: GoogleFonts.poppins(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _cm ? 'cm' : 'm',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // زر المتابعة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Button(
                onButtonPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Goals()));
                },
                buttonText: 'Continue',
                padding: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
