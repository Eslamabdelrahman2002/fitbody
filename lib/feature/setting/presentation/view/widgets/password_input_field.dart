import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final bool showForgotPassword;
  final VoidCallback? onForgotPasswordTap;

  const PasswordInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isObscure = false,
    this.showForgotPassword = false,
    this.onForgotPasswordTap,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isObscureInternal = false; // Internal state for toggling visibility

  @override
  void initState() {
    super.initState();
    _isObscureInternal = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText(
          text: widget.labelText,
          color: AppColors.purple,
          textAlign: TextAlign.left,
          fontSize: 16, // Slightly smaller font for label
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white, // Background color of the text field
            borderRadius: BorderRadius.circular(AppRadius.button), // Rounded corners
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: _isObscureInternal,
            style: const TextStyle(color: AppColors.black), // Text color inside the field
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: InputBorder.none, // Remove default border
              suffixIcon: widget.isObscure
                  ? IconButton(
                icon: FaIcon(
                  _isObscureInternal ? Icons.visibility_off_outlined : Icons.visibility,
                  color: AppColors.purple,
                ),
                onPressed: () {
                  setState(() {
                    _isObscureInternal = !_isObscureInternal;
                  });
                },
              )
                  : null,
            ),

          ),
        ),
        if (widget.showForgotPassword)
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: widget.onForgotPasswordTap,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ParagraphText(
                  text: 'Forgot Password?',
                  color: AppColors.white,
                  textAlign: TextAlign.right,
                  fontSize: 15,
                  // Smaller font for "Forgot Password?"
                ),
              ),
            ),
          ),
      ],
    );
  }
}