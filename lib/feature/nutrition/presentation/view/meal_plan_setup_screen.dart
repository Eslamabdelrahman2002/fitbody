import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/creating_plan_screen.dart';
import 'package:fitness_app/feature/nutrition/presentation/view/widgets/meal_plan_choice_chip.dart';

class MealPlanSetupScreen extends StatefulWidget {
  const MealPlanSetupScreen({super.key});

  @override
  State<MealPlanSetupScreen> createState() => _MealPlanSetupScreenState();
}

class _MealPlanSetupScreenState extends State<MealPlanSetupScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // State variables for user selections on Page One
  String? _selectedDietaryPreference;
  String? _selectedAllergy;
  List<String> _selectedMealTypes = [];

  // State variables for user selections on Page Two
  String? _selectedCaloricGoal;
  String? _selectedCookingTime;
  String? _selectedServings;

  // Data for the choices
  final List<String> _dietaryPreferences = ['Vegetarian', 'Keto', 'Vegan', 'Paleo', 'Gluten-Free', 'No preferences'];
  final List<String> _allergies = ['Nuts', 'Eggs', 'Dairy', 'No allergies', 'Shellfish'];
  final List<String> _mealTypes = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < 1) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      // Logic to create plan
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CreatingPlanScreen()),
      );
    }
  }

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
                    child: const Icon(
                      Icons.arrow_left,
                      color: AppColors.yellow,
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const ScreenTitleText(
                    text: 'Meal Plans',
                    color: AppColors.purple,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(), // Disable swiping
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    _buildPageOne(),
                    _buildPageTwo(),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _onNext,
                  child: Container(
                    width: double.infinity,
                    padding: AppPadding.buttonVertical,
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    ),
                    child: Center(
                      child: ButtonText(
                        text: _currentPage == 0 ? 'Next' : 'Create',
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageOne() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Dietary Preferences', 'What are your dietary preferences?'),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: MealPlanChoiceChip(text: 'Vegetarian', isSelected: _selectedDietaryPreference == 'Vegetarian', onTap: () { setState(() => _selectedDietaryPreference = 'Vegetarian'); })),
                  const SizedBox(width: 8),
                  Expanded(child: MealPlanChoiceChip(text: 'Keto', isSelected: _selectedDietaryPreference == 'Keto', onTap: () { setState(() => _selectedDietaryPreference = 'Keto'); })),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: MealPlanChoiceChip(text: 'Vegan', isSelected: _selectedDietaryPreference == 'Vegan', onTap: () { setState(() => _selectedDietaryPreference = 'Vegan'); })),
                  const SizedBox(width: 8),
                  Expanded(child: MealPlanChoiceChip(text: 'Paleo', isSelected: _selectedDietaryPreference == 'Paleo', onTap: () { setState(() => _selectedDietaryPreference = 'Paleo'); })),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: MealPlanChoiceChip(text: 'Gluten-Free', isSelected: _selectedDietaryPreference == 'Gluten-Free', onTap: () { setState(() => _selectedDietaryPreference = 'Gluten-Free'); })),
                  const SizedBox(width: 8),
                  Expanded(child: MealPlanChoiceChip(text: 'No preferences', isSelected: _selectedDietaryPreference == 'No preferences', onTap: () { setState(() => _selectedDietaryPreference = 'No preferences'); })),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSectionTitle('Allergies', 'Do you have any food allergies we should know about?'),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: MealPlanChoiceChip(text: 'Nuts', isSelected: _selectedAllergy == 'Nuts', onTap: () { setState(() => _selectedAllergy = 'Nuts'); })),
                  const SizedBox(width: 8),
                  Expanded(child: MealPlanChoiceChip(text: 'Eggs', isSelected: _selectedAllergy == 'Eggs', onTap: () { setState(() => _selectedAllergy = 'Eggs'); })),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: MealPlanChoiceChip(text: 'Dairy', isSelected: _selectedAllergy == 'Dairy', onTap: () { setState(() => _selectedAllergy = 'Dairy'); })),
                  const SizedBox(width: 8),
                  Expanded(child: MealPlanChoiceChip(text: 'No allergies', isSelected: _selectedAllergy == 'No allergies', onTap: () { setState(() => _selectedAllergy = 'No allergies'); })),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: MealPlanChoiceChip(text: 'Shellfish', isSelected: _selectedAllergy == 'Shellfish', onTap: () { setState(() => _selectedAllergy = 'Shellfish'); })),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSectionTitle('Meal Types', 'Which meals do you want to plan?'),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: MealPlanChoiceChip(text: 'Breakfast', isSelected: _selectedMealTypes.contains('Breakfast'), onTap: () { setState(() { if (_selectedMealTypes.contains('Breakfast')) { _selectedMealTypes.remove('Breakfast'); } else { _selectedMealTypes.add('Breakfast'); } }); })),
                  const SizedBox(width: 8),
                  Expanded(child: MealPlanChoiceChip(text: 'Dinner', isSelected: _selectedMealTypes.contains('Dinner'), onTap: () { setState(() { if (_selectedMealTypes.contains('Dinner')) { _selectedMealTypes.remove('Dinner'); } else { _selectedMealTypes.add('Dinner'); } }); })),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: MealPlanChoiceChip(text: 'Lunch', isSelected: _selectedMealTypes.contains('Lunch'), onTap: () { setState(() { if (_selectedMealTypes.contains('Lunch')) { _selectedMealTypes.remove('Lunch'); } else { _selectedMealTypes.add('Lunch'); } }); })),
                  const SizedBox(width: 8),
                  Expanded(child: MealPlanChoiceChip(text: 'Snacks', isSelected: _selectedMealTypes.contains('Snacks'), onTap: () { setState(() { if (_selectedMealTypes.contains('Snacks')) { _selectedMealTypes.remove('Snacks'); } else { _selectedMealTypes.add('Snacks'); } }); })),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageTwo() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Caloric Goal', 'What is your daily caloric intake goal?'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRadioButton(text: 'Less than 1500 calories', groupValue: _selectedCaloricGoal, value: 'Less than 1500 calories', onChanged: (value) { setState(() => _selectedCaloricGoal = value); }),
              _buildRadioButton(text: '1500-2000 calories', groupValue: _selectedCaloricGoal, value: '1500-2000 calories', onChanged: (value) { setState(() => _selectedCaloricGoal = value); }),
              _buildRadioButton(text: 'More than 2000 calories', groupValue: _selectedCaloricGoal, value: 'More than 2000 calories', onChanged: (value) { setState(() => _selectedCaloricGoal = value); }),
              _buildRadioButton(text: 'Not sure/Don\'t have a goal', groupValue: _selectedCaloricGoal, value: 'Not sure/Don\'t have a goal', onChanged: (value) { setState(() => _selectedCaloricGoal = value); }),
            ],
          ),
          const SizedBox(height: 20),
          _buildSectionTitle('Cooking Time Preference', 'How much time are you willing to spend cooking each meal?'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRadioButton(text: 'Less than 15 minutes', groupValue: _selectedCookingTime, value: 'Less than 15 minutes', onChanged: (value) { setState(() => _selectedCookingTime = value); }),
              _buildRadioButton(text: '15-30 minutes', groupValue: _selectedCookingTime, value: '15-30 minutes', onChanged: (value) { setState(() => _selectedCookingTime = value); }),
              _buildRadioButton(text: 'More than 30 minutes', groupValue: _selectedCookingTime, value: 'More than 30 minutes', onChanged: (value) { setState(() => _selectedCookingTime = value); }),
            ],
          ),
          const SizedBox(height: 20),
          _buildSectionTitle('Number Of Servings', 'How many servings do you need per meal?'),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildRadioButton(text: '1', groupValue: _selectedServings, value: '1', onChanged: (value) { setState(() => _selectedServings = '1'); })),
                  Expanded(child: _buildRadioButton(text: '3-4', groupValue: _selectedServings, value: '3-4', onChanged: (value) { setState(() => _selectedServings = '3-4'); })),
                ],
              ),
              Row(
                children: [
                  Expanded(child: _buildRadioButton(text: '2', groupValue: _selectedServings, value: '2', onChanged: (value) { setState(() => _selectedServings = '2'); })),
                  Expanded(child: _buildRadioButton(text: 'More than 4', groupValue: _selectedServings, value: 'More than 4', onChanged: (value) { setState(() => _selectedServings = 'More than 4'); })),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText(
          text: title,
          color: AppColors.yellow,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        ParagraphText(
          text: subtitle,
          color: AppColors.white.withOpacity(0.7),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // New helper widget for the radio button and text layout
  Widget _buildRadioButton({
    required String text,
    required String? groupValue,
    required String value,
    required ValueChanged<String?> onChanged,
  }) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: AppColors.yellow,
              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.yellow;
                }
                return AppColors.white;
              }),
            ),
            Text(
              text,
              style: TextStyle(
                color:  AppColors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}