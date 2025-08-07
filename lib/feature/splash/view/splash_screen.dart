import 'package:fitness_app/feature/splash/view/splash_screen2.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // انتظار 3 ثواني ثم الانتقال
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SplashScreen2()),
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
