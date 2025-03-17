import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/navigation_destination.dart';
import 'pages/forecast_screen.dart';
import 'pages/search_screen.dart';
import 'pages/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  final screens = [
    WeatherScreen(),
    SearchScreen(),
    ForecastScreen(),
    Container(color: Colors.yellow),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBlack,
      body: screens[currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        child: NavigationBar(
          destinations: destinations,
          backgroundColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: currentPageIndex,
          elevation: 0.0,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
        ),
      ),
    );
  }
}
