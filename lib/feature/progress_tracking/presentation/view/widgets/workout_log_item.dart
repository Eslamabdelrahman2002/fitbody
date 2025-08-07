import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutLogItem extends StatelessWidget {
  final int calories;
  final String title;
  final String date;
  final String duration;
  final VoidCallback onTap;

  const WorkoutLogItem({
    Key? key,
    required this.calories,
    required this.title,
    required this.date,
    required this.duration,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.pageHorizontal,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.contentBox),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: AppColors.purple,
                        shape: BoxShape.circle
                    ),
                    child:Center(child: FaIcon(Icons.directions_run,color: AppColors.white,size: 30,)),
                  ),
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_fire_department_outlined,color: AppColors.purple,size: 20,),
                          SubtitleText(text: '$calories Kcal',color: AppColors.black,)
                        ],
                      ),
                      SubtitleText(text: '$title',color: AppColors.black,fontSize: 15,),
                      SubtitleText(text: '$date',color: AppColors.purpleLight,fontSize: 15,),

                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      SubtitleText(text: 'Duration',color: AppColors.purple,fontSize: 15,),
                      Row(
                        children: [
                          Icon(Icons.timer,color: AppColors.purple,size: 20,),
                          SubtitleText(text: '$duration',color: AppColors.purple,)
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}