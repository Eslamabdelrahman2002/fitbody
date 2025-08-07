import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';

class UserInfoCard extends StatelessWidget {
  final String name;
  final int age;
  final int weight;
  final double height;
  final String imagePath;

  const UserInfoCard({
    Key? key,
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purple,
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TitleText(
                      text: name,
                      color: AppColors.white,
                      textAlign: TextAlign.left,
                    ),
                    Icon(Icons.female,size: 23,color: AppColors.yellow,)
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    ParagraphText(
                      text: 'Age: ',
                      color: AppColors.white,
                      fontSize: 14,
                      textAlign: TextAlign.left,
                    ),
                    ParagraphText(
                      text: '$age',
                      color: AppColors.white,
                      fontSize: 14,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                   Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Container(
                         width: 4,
                         height: 30,
                         decoration: BoxDecoration(
                           color: AppColors.yellow,
                           borderRadius: BorderRadius.circular(25)
                         ),
                       ),
                       SizedBox(width: 5,),
                       Column(children: [
                         ScreenTitleText(text: '$weight Kg',color: AppColors.white,fontSize: 15,),
                         ParagraphText(text:'Weight',color: AppColors.white,fontSize: 12,)
                       ],),

                     ],
                   ),
                    SizedBox(width: 50,),
                    Container(
                      width: 4,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(25)
                      ),
                    ),
                    SizedBox(width: 5,),
                    Column(children: [
                      ScreenTitleText(text: '$height CM',color: AppColors.white,fontSize: 15,),
                      ParagraphText(text:'height',color: AppColors.white,fontSize: 12,textAlign: TextAlign.left,)
                    ],),
                  ],
                ),

              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              imagePath,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
