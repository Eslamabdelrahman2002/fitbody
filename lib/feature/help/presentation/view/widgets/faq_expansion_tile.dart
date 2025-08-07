import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class FaqExpansionTile extends StatefulWidget {
  final String question;
  final String answer;

  const FaqExpansionTile({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  State<FaqExpansionTile> createState() => _FaqExpansionTileState();
}

class _FaqExpansionTileState extends State<FaqExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: ExpansionTile(
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isExpanded = expanded;
                });
              },
              collapsedIconColor: AppColors.white,
              iconColor: AppColors.white,
              backgroundColor:  AppColors.black,
              collapsedBackgroundColor: AppColors.black,
              title: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: _isExpanded
                    ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.yellow,
                      width: 2.0,
                    ),
                  ),
                )
                    : null,
                child: ParagraphText( // <-- تم التغيير هنا من SubtitleText إلى ParagraphText
                  text: widget.question,
                  color: AppColors.white,
                  textAlign: TextAlign.left,

                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                  child: ParagraphText(
                    text: widget.answer,
                    color: AppColors.white.withOpacity(0.8),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1.0,
            color: AppColors.yellow,
            margin: const EdgeInsets.symmetric(horizontal: 0),
          ),
        ],
      ),
    );
  }
}