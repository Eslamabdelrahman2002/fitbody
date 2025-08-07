import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class ArticleTipCard extends StatefulWidget { // Changed to StatefulWidget
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const ArticleTipCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ArticleTipCard> createState() => _ArticleTipCardState();
}

class _ArticleTipCardState extends State<ArticleTipCard> {
  bool _isFavorited = false; // Internal state for the star icon

  @override
  void initState() {
    super.initState();
    // If you need to initialize _isFavorited based on external data, do it here
    // _isFavorited = widget.initialIsFavorited;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    // You might also want to call a callback to notify the parent about the favorite change
    // widget.onFavoriteToggle?.call(_isFavorited);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: widget.onTap, // Keep the card's main tap functionality
        child: Container(
          width: 180, // Fixed width for the card as per image
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.contentBox), // Rounded corners
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack( // Use Stack to layer image and star icon
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.contentBox)),
                    child: Image.asset(
                      widget.imagePath,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector( // Make the star icon tappable
                      onTap: _toggleFavorite, // Call the toggle method
                      child: Icon(
                        Icons.star,
                        color: _isFavorited ? AppColors.yellow : Colors.white.withOpacity(0.5), // Yellow if favorited, 50% opacity white otherwise
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SubtitleText(
                  text: widget.title,
                  color: AppColors.white,
                  fontSize: 16, // Adjust font size for title
                  textAlign: TextAlign.left,
                  maxLines: 2, // Allow title to wrap

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}