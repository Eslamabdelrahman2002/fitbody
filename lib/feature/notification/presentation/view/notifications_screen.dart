import 'package:fitness_app/feature/notification/presentation/view/widgets/notification_item_card.dart';
import 'package:fitness_app/feature/notification/presentation/view/widgets/notification_tab_button.dart';
import 'package:fitness_app/feature/profile/presentation/view/profile.dart';
import 'package:fitness_app/feature/search/presentation/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon;

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String selectedTab = 'Reminders'; // State for selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // App Bar
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:  FaIcon(
                      Icons.arrow_left_outlined,
                      color: AppColors.yellow,
                      size: 25,
                    ),
                  ),
                  const ScreenTitleText(
                    text: 'Notifications',
                    color: AppColors.purple,
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                      }, icon: Icon(Icons.search,color: AppColors.purple,)),
                      SizedBox(width: 15),
                     IconButton(onPressed: ()
                     {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
                     },icon: Icon(Icons.person,color: AppColors.purple,),) // Using person icon as a placeholder for the rightmost icon
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Reminders / System Toggle Buttons
              Row(
                children: [
                  Expanded(
                    child: NotificationTabButton(
                      text: 'Reminders',
                      isSelected: selectedTab == 'Reminders',
                      onTap: () {
                        setState(() {
                          selectedTab = 'Reminders';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 25,),
                  Expanded(
                    child: NotificationTabButton(
                      text: 'System',
                      isSelected: selectedTab == 'System',
                      onTap: () {
                        setState(() {
                          selectedTab = 'System';
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    // Today Section
                    SubtitleText(
                      text: 'Today',
                      color: AppColors.yellow,
                      textAlign: TextAlign.left,
                      fontSize: 18, // Adjust font size for section titles
                    ),
                    const SizedBox(height: 10),
                    if (selectedTab == 'Reminders') ...[
                      NotificationItemCard(
                        icon: Icons.star, // Example icon for New Workout
                        title: 'New Workout is Available',
                        date: 'June 10',
                        time: '10:00 AM',
                      ),
                      NotificationItemCard(
                        icon: Icons.lightbulb_outline, // Example icon for Drink Water
                        title: 'Don\'t Forget To Drink Water',
                        date: 'June 10',
                        time: '8:00 AM',
                      ),
                    ] else if (selectedTab == 'System') ...[
                      NotificationItemCard(
                        icon: Icons.star, // Example icon for New Message
                        title: 'You Have A New Message!',
                        date: 'June 10',
                        time: '2:00 PM',
                      ),
                      NotificationItemCard(
                        icon: Icons.assignment, // Example icon for Scheduled Maintenance
                        title: 'Scheduled Maintenance.',
                        date: 'June 10',
                        time: '8:00 AM',
                      ),
                      NotificationItemCard(
                        icon: Icons.security, // Example icon for New Device Login
                        title: 'We\'ve Detected A Login From A New Device',
                        date: 'June 10',
                        time: '5:00 AM',
                      ),
                    ],

                    const SizedBox(height: 20),

                    // Yesterday Section
                    SubtitleText(
                      text: 'Yesterday',
                      color: AppColors.yellow,
                      textAlign: TextAlign.left,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 10),
                    if (selectedTab == 'Reminders') ...[
                      NotificationItemCard(
                        icon: Icons.fitness_center, // Example icon for Workout Completed
                        title: 'Upper Body Workout Completed!',
                        date: 'June 09',
                        time: '8:00 PM',
                      ),
                      NotificationItemCard(
                        icon: Icons.lightbulb_outline, // Example icon for Exercise Session
                        title: 'Remember Your Exercise Session',
                        date: 'June 09',
                        time: '3:00 PM',
                      ),
                      NotificationItemCard(
                        icon: Icons.assignment, // Example icon for New Article
                        title: 'New Article & Tip Posted!',
                        date: 'June 09',
                        time: '11:00 AM',
                      ),
                    ] else if (selectedTab == 'System') ...[
                      NotificationItemCard(
                        icon: Icons.assignment, // Example icon for Privacy Policy Update
                        title: 'We\'ve Updated Our Privacy Policy',
                        date: 'June 09',
                        time: '1:00 PM',
                      ),
                      NotificationItemCard(
                        icon: Icons.star, // Example icon for New Message
                        title: 'You Have A New Message!',
                        date: 'June 09',
                        time: '9:00 AM',
                      ),
                    ],

                    const SizedBox(height: 20),

                    // May 29 - 20XX Section
                    SubtitleText(
                      text: 'May 29 - 2024',
                      color: AppColors.yellow,
                      textAlign: TextAlign.left,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 10),
                    if (selectedTab == 'Reminders') ...[
                      NotificationItemCard(
                        icon: Icons.star, // Example icon for New Challenge
                        title: 'You Started A New Challenge!',
                        date: 'May 29',
                        time: '9:00 AM',
                      ),
                      NotificationItemCard(
                        icon: Icons.home, // Example icon for House Training
                        title: 'New House Training ideas!',
                        date: 'May 29',
                        time: '8:20 AM',
                      ),
                    ] else if (selectedTab == 'System') ...[
                      NotificationItemCard(
                        icon: Icons.star, // Example icon for New Message
                        title: 'You Have A New Message!',
                        date: 'May 29',
                        time: '10:00 AM',
                      ),
                      NotificationItemCard(
                        icon: Icons.assignment, // Example icon for Terms of Service
                        title: 'We\'ve Made Changes To Our Terms Of Service',
                        date: 'May 29',
                        time: '8:30 AM',
                      ),
                    ],
                    const SizedBox(height: 20), // Padding at the end of the list
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}