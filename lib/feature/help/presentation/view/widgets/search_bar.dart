import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:google_fonts/google_fonts.dart'; // To use ParagraphText for placeholder

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purple, // Background color of the search bar
        borderRadius: BorderRadius.circular(AppRadius.button), // Rounded corners
      ),
      child: TextField(
        style: const TextStyle(color: AppColors.white), // Input text color
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.poppins(
            fontSize: 16,
            color: AppColors.white.withOpacity(0.7), // Placeholder text color
          ),
          prefixIcon: Icon(Icons.search, color: AppColors.white.withOpacity(0.7)),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: InputBorder.none, // Remove default border
        ),
        cursorColor: AppColors.yellow, // Cursor color
      ),
    );
  }
}