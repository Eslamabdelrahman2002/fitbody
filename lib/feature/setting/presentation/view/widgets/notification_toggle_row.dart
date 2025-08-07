import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';

class NotificationToggleRow extends StatelessWidget {
  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationToggleRow({
    Key? key,
    required this.text,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubtitleText(
            text: text,
            color: AppColors.white,
            textAlign: TextAlign.left,
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.yellow, // Color when the switch is ON
            inactiveThumbColor: AppColors.purpleLight, // Color of the thumb when OFF
            inactiveTrackColor: AppColors.purple, // Color of the track when OFF
          ),
        ],
      ),
    );
  }
}