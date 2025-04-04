import 'package:flutter/material.dart';
import 'package:home_automation01/Models/bottom_nav_bar.dart';
import 'package:home_automation01/Pages/home_screen.dart';
import 'package:home_automation01/Pages/about_us.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
// this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update our selected index
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    const ControlPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: SafeArea(child: _pages[_selectedIndex]),
    );
  }
}
