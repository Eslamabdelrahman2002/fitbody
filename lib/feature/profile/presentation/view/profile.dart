import 'package:fitness_app/feature/edit_profile/presentation/view/edit_profile_screen.dart';
import 'package:fitness_app/feature/profile/presentation/view/widgets/profile_back_button.dart';
import 'package:fitness_app/feature/profile/presentation/view/widgets/profile_details_card.dart';
import 'package:fitness_app/feature/profile/presentation/view/widgets/profile_picture.dart';
import 'package:fitness_app/feature/profile/presentation/view/widgets/row_content_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart'; // Import your colors
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

import '../../../favorite/presentation/view/favorites_screen.dart';
import '../../../help/presentation/view/help_faqs_screen.dart';
import '../../../setting/presentation/view/settings_screen.dart'; // Import AppRadius for consistent border radius


class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take more screen height
      backgroundColor: Colors.transparent, // Make bottom sheet background transparent
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 25),
          decoration: BoxDecoration(
            color: AppColors.purpleLight, // Background color of the bottom sheet
            borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.contentBox)), // Rounded top corners
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Make column take minimum space
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            TitleText(
            text: 'Are you sure you want to log out?', // Message
            color: AppColors.black, // Text color
            fontSize: 20, // Adjust font size as needed
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white, // Cancel button color
                      borderRadius: BorderRadius.circular(AppRadius.button), // Rounded corners
                    ),
                    child: ButtonText(
                      text: 'Cancel', // Cancel button text
                      color: AppColors.purple, // Text color
                    ),
                  ),
                ),),
                 SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Close the bottom sheet

                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.yellow, // Yes, logout button color
                        borderRadius: BorderRadius.circular(AppRadius.button), // Rounded corners
                      ),
                      child: Center(
                        child: ButtonText(
                          text: 'Yes, logout', // Yes, logout button text
                          color: AppColors.black, // Text color
                        ),
                      ),
                    ),
                  ),
                ),
                ],
              ),
              const SizedBox(height: 10), // Add some padding at the bottom
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black, // Background color from the image
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 460,
              child: Stack(
                children: [
                  Container(
                    color: AppColors.purpleLight,
                    height: 420,
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        ProfileBackButton(),
                        const SizedBox(height: 30),
                        const ProfilePicture(), // Your existing profile picture widget
                        const SizedBox(height: 10),
                        TitleText(
                          text: 'Madison Smith', // Name
                          color: AppColors.white, // Changed to named argument
                        ),
                        SubtitleText(
                          text: 'madisons@example.com', // Email
                          color: AppColors.white, // Changed to named argument
                        ),
                        const SizedBox(height: 5),
                        SubtitleText(
                          text: 'Birthday: April 1st', // Birthday
                          color: AppColors.white, // Changed to named argument
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: const ProfileDetailCard()),
                ],
              ),
            ),
            RowContentNavScreen(
                icon: Icons.person,
                text: 'Profile',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()))
            ),
            RowContentNavScreen(
                icon: Icons.star,
                text: 'Favorite',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesScreen()))
            ),
            RowContentNavScreen(icon: Icons.lock_person, text: 'Privacy Policy', onTap: (){}),
            RowContentNavScreen(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()))
            ),
            RowContentNavScreen(
                icon: Icons.headset_mic,
                text: 'Help',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HelpFaqsScreen()))
            ),
            RowContentNavScreen(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () => _showLogoutBottomSheet(context) // Calls the bottom sheet
            )
          ],
        ),
      ),
    );
  }
}