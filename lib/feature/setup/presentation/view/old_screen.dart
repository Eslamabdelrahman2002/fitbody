
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/setup/presentation/view/weight.dart';
import 'package:fitness_app/feature/setup/presentation/view/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:fitness_app/core/costant/color.dart';
import '../../../auth/presentation/view/widgets/button.dart';

class OldScreen extends StatefulWidget {
  const OldScreen({super.key});

  @override
  State<OldScreen> createState() => _OldScreenState();
}

class _OldScreenState extends State<OldScreen> {
  int _currentValue = 28;

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
            TitleText(
              text: 'How Old Are You?',
              color: AppColors.white,
            ),
            const SizedBox(height: 31),
            ParagraphText(
              text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ',
            color: AppColors.white,
            ),
            const SizedBox(height: 90),
            Text(
              '$_currentValue',
              style: GoogleFonts.poppins(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 13),
            Icon(
              Icons.arrow_drop_up,
              color: AppColors.yellow,
              size: 50,
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
              color: AppColors.purpleLight,
              child: Center(
                child: NumberPicker(
                  value: _currentValue,
                  minValue: 9,
                  maxValue: 80,
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
            const Spacer(),
            Button(
              onButtonPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight()));
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

