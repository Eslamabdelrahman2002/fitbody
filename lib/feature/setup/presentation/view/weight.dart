import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/setup/presentation/view/height.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../../core/costant/color.dart';
import '../../../auth/presentation/view/widgets/button.dart';
import 'package:fitness_app/feature/setup/presentation/view/widgets/back_button.dart';

class Weight extends StatefulWidget {
  const Weight({super.key});

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  int _currentValue = 75;
  bool _isKg = true;

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
              text: 'What Is Your Weight?',
              color: AppColors.white,
            ),
            const SizedBox(height: 31),
            ParagraphText(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ',
              color: AppColors.white,
            ),
            const SizedBox(height: 150),

            Container(
              height: 120,
              color: AppColors.purpleLight,
              child: Center(
                child: NumberPicker(
                  value: _currentValue,
                  minValue: 35,
                  maxValue: 180,
                  step: 1,
                  itemCount: 5,
                  axis: Axis.horizontal,
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
            const SizedBox(height: 13),
            Icon(
              Icons.arrow_drop_up,
              color: AppColors.yellow,
              size: 50,
            ),
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
                  _isKg ? 'Kg' : 'Lb',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Button(
                onButtonPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Height()));
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
