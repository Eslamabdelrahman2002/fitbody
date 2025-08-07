import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final Color? color;
  final String text;
  final Function() function; // Change to Function()
  final Color textColor; // Add textColor property

  const LevelButton({
    super.key,
    this.color,
    required this.text,
    required this.function,
    this.textColor = Colors.white, // Default text color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPadding.buttonVertical, // Use margin for spacing outside the button
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Material( // Wrap with Material to allow for InkWell splash effect
        color: Colors.transparent, // Make Material transparent
        child: InkWell( // Use InkWell for custom tap behavior and splash
          onTap: function, // Call the function on tap
          borderRadius: BorderRadius.circular(50),
          child: Container(
            alignment: Alignment.center,

            padding: AppPadding.buttonVertical, // Adjust padding as needed
            child: ScreenTitleText(
               text: text,color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}