import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/costant/color.dart';
import 'package:fitness_app/core/costant/text.dart';
import 'package:fitness_app/core/costant/app_padding.dart';
import 'package:fitness_app/core/costant/app_radius.dart';
import 'package:fitness_app/feature/progress_tracking/presentation/view/widgets/progress_tracking_tab.dart';
import 'package:fitness_app/feature/progress_tracking/presentation/view/widgets/user_info_card.dart';
import 'package:fitness_app/feature/progress_tracking/presentation/view/widgets/workout_log_item.dart';
import 'package:fitness_app/feature/progress_tracking/presentation/view/widgets/progress_chart_item.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../profile/presentation/view/profile.dart';
import '../../../search/presentation/view/search_screen.dart';

class ProgressTrackingScreen extends StatefulWidget {
  const ProgressTrackingScreen({super.key});

  @override
  State<ProgressTrackingScreen> createState() => _ProgressTrackingScreenState();
}

class _ProgressTrackingScreenState extends State<ProgressTrackingScreen> {
  String selectedTab = 'Workout Log';
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: AppPadding.pageHorizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_left_outlined,
                      color: AppColors.yellow,
                      size: 25,
                    ),
                  ),
                  const ScreenTitleText(
                    text: 'Progress tracking',
                    color: AppColors.purple,
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                        },
                        icon: const Icon(Icons.search, color: AppColors.purple),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
                        },
                        icon: const Icon(Icons.person, color: AppColors.purple),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: AppPadding.pageHorizontal,
              child: Row(
                children: [
                  Expanded(
                    child: ProgressTrackingTab(
                      text: 'Workout',
                      isSelected: selectedTab == 'Workout',
                      onTap: () {
                        setState(() {
                          selectedTab = 'Workout';
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: ProgressTrackingTab(
                      text: 'Charts',
                      isSelected: selectedTab == 'Charts',
                      onTap: () {
                        setState(() {
                          selectedTab = 'Charts';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (selectedTab == 'Workout')
                      _buildWorkoutLogView()
                    else
                      _buildProgressChartsView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutLogView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfoCard(
          name: 'Madison',
          age: 28,
          weight: 75,
          height: 1.65,
          imagePath: 'assets/images/profile.png',
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(25),
          child: _buildCalendar(),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: AppPadding.pageHorizontal,
          child: TitleText(
            text: 'Activities',
            color: AppColors.yellow,
            fontSize: 20,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 10),
        WorkoutLogItem(
          calories: 730,
          title: 'Upper Body Workout',
          date: 'June 09',
          duration: '25 Mins',
          onTap: () {},
        ),
        WorkoutLogItem(
          calories: 130,
          title: 'Pull Out',
          date: 'April 15',
          duration: '30 Mins',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.circular(AppRadius.contentBox),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onPageChanged: (focusedDay) => _focusedDay = focusedDay,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: GoogleFonts.poppins(
              color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold),
          leftChevronIcon: const Icon(Icons.chevron_left, color: AppColors.white),
          rightChevronIcon: const Icon(Icons.chevron_right, color: AppColors.white),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
              color: AppColors.purpleLight, shape: BoxShape.circle),
          selectedDecoration: const BoxDecoration(
              color: AppColors.yellow, shape: BoxShape.circle),
          selectedTextStyle: GoogleFonts.poppins(color: AppColors.black),
          defaultTextStyle: GoogleFonts.poppins(color: AppColors.white),
          weekendTextStyle:
          GoogleFonts.poppins(color: AppColors.white.withOpacity(0.5)),
          outsideDaysVisible: false,
          markerDecoration:
          const BoxDecoration(color: AppColors.yellow, shape: BoxShape.circle),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: GoogleFonts.poppins(color: AppColors.white),
          weekendStyle:
          GoogleFonts.poppins(color: AppColors.white.withOpacity(0.5)),
        ),
      ),
    );
  }

  Widget _buildProgressChartsView() {
    return Padding(
      padding: AppPadding.pageHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubtitleText(
            text: 'My Progress',
            color: AppColors.yellow,
            fontSize: 15,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          TitleText(
            text: 'January 12th',
            color: AppColors.yellow,
            fontSize: 18,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          Container(
            height: 250,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubtitleText(text: 'Steps',color: AppColors.yellow,fontSize: 15,),
                const SizedBox(height: 16),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 170,
                      minY: 150,
                      barTouchData: BarTouchData(enabled: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 5,
                            reservedSize: 30,
                            getTitlesWidget: (value, _) => Text(
                              value.toInt().toString(),
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, _) {
                              switch (value.toInt()) {
                                case 0:
                                  return const Text("Jan", style: TextStyle(color: Colors.yellow));
                                case 1:
                                  return const Text("Feb", style: TextStyle(color: Colors.yellow));
                                case 2:
                                  return const Text("Mar", style: TextStyle(color: Colors.yellow));
                                case 3:
                                  return const Text("Apr", style: TextStyle(color: Colors.yellow));
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: const Border(
                          bottom: BorderSide(color: Colors.white),
                        ),
                      ),
                      barGroups: [
                        makeBarGroup(0, 160),
                        makeBarGroup(1, 165),
                        makeBarGroup(2, 155),
                        makeBarGroup(3, 158),
                      ],
                      gridData: FlGridData(show: false),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ProgressChartItem(
            day: 'Thu',
            date: 14,
            steps: 3679,
            duration: '1hr40m',
          ),
          ProgressChartItem(
            day: 'Wen',
            date: 20,
            steps: 5789,
            duration: '1hr20m',
          ),
          ProgressChartItem(
            day: 'Sat',
            date: 22,
            steps: 1859,
            duration: '1hr10m',
          ),
          ProgressChartItem(
            day: 'Thu',
            date: 14,
            steps: 3679,
            duration: '1hr40m',
          ),
          ProgressChartItem(
            day: 'Wen',
            date: 20,
            steps: 5789,
            duration: '1hr20m',
          ),
          ProgressChartItem(
            day: 'Sat',
            date: 22,
            steps: 1859,
            duration: '1hr10m',
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeBarGroup(int x, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: 170,
          color: Colors.grey[300],
          width: 14,
          borderRadius: BorderRadius.circular(6),
          rodStackItems: [
            BarChartRodStackItem(150, value, Colors.yellow),
            BarChartRodStackItem(value, 170, Colors.grey[300]!),
          ],
        ),
      ],
    );
  }
}
