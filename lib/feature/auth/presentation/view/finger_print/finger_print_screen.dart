import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

import '../../../../../core/costant/color.dart';
import '../../../../../core/costant/text.dart';
import '../set_password/set_password_screen.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import '../widgets/finger_print_content_box.dart';

class FingerPrintScreen extends StatelessWidget {
  const FingerPrintScreen({super.key});

  Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      bool isAuthenticated = false;

      if (canCheckBiometrics) {
        isAuthenticated = await auth.authenticate(
          localizedReason: 'Place your finger to authenticate',
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
          ),
        );
      }
      return isAuthenticated;
    } on PlatformException catch (e) {
      print("Error using biometric auth: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            AppBarScreen(screenTitle: 'Set Your Fingerprint'),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 65),
                  const ParagraphText(
                    text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n magna aliqua. ",
                    color: AppColors.white,
                  ),
                  const SizedBox(height: 70),
                  const FingerPrintContentBox(),
                  const SizedBox(height: 20),
                  Button(
                    onButtonPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetPasswordScreen(),
                        ),
                      );
                    },
                    buttonText: "Skip",
                    padding: 75,
                  ),
                  Button(
                    onButtonPressed: () async {
                      bool isAuth = await authenticateWithBiometrics();
                      if (isAuth) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetPasswordScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Authentication failed')),
                        );
                      }
                    },
                    buttonText: "Continue",
                    padding: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
