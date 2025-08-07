import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProgressChartItem extends StatelessWidget {
  final String day;
  final int date;
  final int steps;
  final String duration;

  const ProgressChartItem({
    Key? key,
    required this.day,
    required this.date,
    required this.steps,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.circular(AppRadius.contentBox),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SubtitleText(
                text: day,
                color: AppColors.white,
                fontSize: 14,
              ),
              const SizedBox(width: 5),
              SubtitleText(
                text: '$date',
                color: AppColors.yellow,
                fontSize: 14,
              ),
            ],
          ),
          Container(width: 2,height: 40,decoration: BoxDecoration(
            color: AppColors.white,borderRadius: BorderRadius.circular(25)
          ),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubtitleText(
                text: 'Steps',
                color: AppColors.white,
                fontSize: 14,
              ),
              const SizedBox(height: 5),
              ParagraphText(
                text: '$steps',
                color: AppColors.white,
                fontSize: 17,
              ),
            ],
          ),
          Container(width: 2,height: 40,decoration: BoxDecoration(
              color: AppColors.white,borderRadius: BorderRadius.circular(25)
          ),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubtitleText(
                text: 'Duration',
                color: AppColors.white,
                fontSize: 14,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  FaIcon(Icons.timer,color: AppColors.white,size: 22,),
                  ParagraphText(
                    text: duration,
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}