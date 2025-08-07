import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/feature/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    // انتظار 3 ثواني ثم الانتقال
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // وسط الشاشة عموديًا
            children: [
              TitleText(text: "Welcome to",color: AppColors.yellow,),
              SizedBox(height: 18,),
              Image.asset(
                "assets/images/logo1.png",
                height: 128.69,
                width: 359,
              ),
              const SizedBox(height: 15),
              Image.asset(
                "assets/images/FITBODY.png",
                height: 58,
                width: 433,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
