import 'dart:io';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fitness_app/core/costant/color.dart';

class ProfilePictureWithEdit extends StatefulWidget {
  const ProfilePictureWithEdit({super.key});

  @override
  State<ProfilePictureWithEdit> createState() => _ProfilePictureWithEditState();
}

class _ProfilePictureWithEditState extends State<ProfilePictureWithEdit> {
  File? _image; // To store the selected image file

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // Pick from gallery

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the state with the new image
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.purpleLight
      ),
      child: Center(
        child: Stack(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 80, // Adjust the size of the circle avatar
              backgroundImage: _image != null // Check if an image is selected
                  ? FileImage(_image!) as ImageProvider // Use FileImage if an image is selected
                  : const AssetImage('assets/images/profile.png') as ImageProvider, // Fallback to asset image
            ),
            // Edit Icon
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: _pickImage, // Call the _pickImage method on tap
                child: Container(
                  padding: const EdgeInsets.all(8), // Padding around the icon
                  decoration: BoxDecoration(
                    color: AppColors.yellow, // Use your yellow color for the background
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.black, width: 2), // Optional: add a border
                  ),
                  child: Icon(
                    Icons.edit, // Use Flutter's built-in edit icon
                    color: AppColors.black, // Color of the edit icon
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}