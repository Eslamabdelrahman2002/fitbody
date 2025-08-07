import 'package:fitness_app/feature/help/presentation/view/widgets/contact_us_list_tile.dart';
import 'package:fitness_app/feature/help/presentation/view/widgets/faq_category_chip.dart';
import 'package:fitness_app/feature/help/presentation/view/widgets/faq_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpFaqsScreen extends StatefulWidget {
  const HelpFaqsScreen({super.key});

  @override
  State<HelpFaqsScreen> createState() => _HelpFaqsScreenState();
}

class _HelpFaqsScreenState extends State<HelpFaqsScreen> {
  bool showFaq = true; // State to toggle between FAQ and Contact Us
  String selectedFaqCategory = 'General'; // State for selected FAQ category

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
                    child: const FaIcon(
                      Icons.arrow_left_outlined,
                      color: AppColors.yellow,
                      size: 27,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const ScreenTitleText(
                    text: 'Help & FAQs',
                    color: AppColors.purple,
                    textAlign: TextAlign.left, // Adjust alignment for app bar title
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Center(
                child: const SubtitleText(
                  text: 'How Can We Help You?',
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 20),

              // FAQ / Contact Us Toggle Buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showFaq = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: showFaq ? AppColors.yellow : AppColors.purpleLight,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(50),right:Radius.circular(50) ),
                        ),
                        child: Center(
                          child: ButtonText(
                            text: 'FAQ',
                            color: showFaq ? AppColors.black : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showFaq = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: showFaq ? AppColors.white : AppColors.yellow,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(50),
                          left: Radius.circular(50)),
                        ),
                        child: Center(
                          child: ButtonText(
                            text: 'Contact Us',
                            color: showFaq ? AppColors.purple : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (showFaq) ...[
                        // FAQ Content
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaqCategoryChip(
                              text: 'General',
                              isSelected: selectedFaqCategory == 'General',
                              onTap: () {
                                setState(() {
                                  selectedFaqCategory = 'General';
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            FaqCategoryChip(
                              text: 'Account',
                              isSelected: selectedFaqCategory == 'Account',
                              onTap: () {
                                setState(() {
                                  selectedFaqCategory = 'Account';
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            FaqCategoryChip(
                              text: 'Services',
                              isSelected: selectedFaqCategory == 'Services',
                              onTap: () {
                                setState(() {
                                  selectedFaqCategory = 'Services';
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const SearchBar(),
                        const SizedBox(height: 20),
                        FaqExpansionTile(
                          question: 'Lorem ipsum dolor sit amet?',
                          answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque, quam vel tincidunt tortor, placerat a odio. Aenean in sagittis magna, ut feugiat diam.',
                        ),
                        FaqExpansionTile(
                          question: 'Lorem ipsum dolor sit amet?',
                          answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque, quam vel tincidunt tortor, placerat a odio. Aenean in sagittis magna, ut feugiat diam.',
                        ),
                        FaqExpansionTile(
                          question: 'Lorem ipsum dolor sit amet?',
                          answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque, quam vel tincidunt tortor, placerat a odio. Aenean in sagittis magna, ut feugiat diam.',
                        ),
                        FaqExpansionTile(
                          question: 'Lorem ipsum dolor sit amet?',
                          answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque, quam vel tincidunt tortor, placerat a odio. Aenean in sagittis magna, ut feugiat diam.',
                        ),
                        FaqExpansionTile(
                          question: 'Lorem ipsum dolor sit amet?',
                          answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque, quam vel tincidunt tortor, placerat a odio. Aenean in sagittis magna, ut feugiat diam.',
                        ),
                        FaqExpansionTile(
                          question: 'Lorem ipsum dolor sit amet?',
                          answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque, quam vel tincidunt tortor, placerat a odio. Aenean in sagittis magna, ut feugiat diam.',
                        ),
                      ] else ...[
                        // Contact Us Content
                        ContactUsListTile(
                          icon: Icons.headphones,
                          text: 'Customer service',
                          onTap: () {
                            // Handle Customer service tap
                          },
                        ),
                        ContactUsListTile(
                          icon: Icons.language_sharp,
                          text: 'Website',
                          onTap: () {
                            // Handle Website tap
                          },
                        ),
                        ContactUsListTile(
                          icon: Icons.chat, // Represents WhatsApp
                          text: 'Whatsapp',
                          onTap: () {
                            // Handle Whatsapp tap
                          },
                        ),
                        ContactUsListTile(
                          icon: Icons.facebook_outlined, // Represents Facebook
                          text: 'Facebook',
                          onTap: () {
                            // Handle Facebook tap
                          },
                        ),
                        ContactUsListTile(
                          icon: Icons.camera_alt_outlined, // Represents Instagram
                          text: 'Instagram',
                          onTap: () {
                            // Handle Instagram tap
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}