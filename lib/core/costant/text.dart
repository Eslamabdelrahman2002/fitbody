import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize; // Add this
  final TextAlign? textAlign;

  const TitleText({
    required this.text,
    this.color = Colors.black,
    this.fontSize, // Initialize
    this.textAlign = TextAlign.center, // Initialize

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign, // Use the new property
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 25, // Use the new property
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize; // Add this
  final TextAlign? textAlign;
  final int? maxLines;// Add this

  const SubtitleText({
    required this.text,
    this.color = Colors.grey,
    this.fontSize, // Initialize
    this.textAlign = TextAlign.center, // Initialize
    super.key, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign, // Use the new property
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 18, // Use the new property
        color: color,

      ),
      overflow:TextOverflow.ellipsis,
      maxLines:maxLines,
    );
  }
}

class ScreenTitleText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize; // Add this
  final TextAlign? textAlign; // Add this

  const ScreenTitleText({
    required this.text,
    this.color = Colors.blue,
    this.fontSize, // Initialize
    this.textAlign = TextAlign.center, // Initialize
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign, // Use the new property
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 20, // Use the new property
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class ParagraphText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize; // Add this
  final TextAlign? textAlign; // Add this
  final int? maxLines; // Add this
  final TextOverflow? overflow; // Add this

  const ParagraphText({
    required this.text,
    this.color = Colors.black87,
    this.fontSize, // Initialize
    this.textAlign = TextAlign.center, // Initialize
    this.maxLines, // Initialize
    this.overflow, // Initialize
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign, // Use the new property
      style: GoogleFonts.leagueSpartan(
        fontSize: fontSize ?? 14, // Use the new property
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.5,
      ),
      maxLines: maxLines, // Use the new property
      overflow: overflow, // Use the new property
    );
  }
}

class ButtonText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize; // Add this
  final TextAlign? textAlign; // Add this

  const ButtonText({
    required this.text,
    this.color = Colors.black,
    this.fontSize, // Initialize
    this.textAlign = TextAlign.center, // Initialize
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign, // Use the new property
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 18, // Use the new property
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}