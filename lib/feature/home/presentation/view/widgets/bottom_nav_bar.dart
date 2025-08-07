import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // Fixed height for the bottom bar
      decoration: BoxDecoration(
        color: AppColors.purpleLight, // Background color of the bar

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.description, 1), // Using description for the second icon
          _buildNavItem(Icons.star, 2),
          _buildNavItem(Icons.headset_mic, 3), // Using headset_mic for the fourth icon
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selectedIndex == index ? AppColors.yellow : AppColors.white.withOpacity(0.7),
            size: 28,
          ),

        ],
      ),
    );
  }
}