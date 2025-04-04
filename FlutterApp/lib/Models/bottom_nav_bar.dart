// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        color: Colors.grey[600],
        activeColor: Colors.white,
        //tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Theme.of(context).colorScheme.secondary,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        tabBorderRadius: 14,
        curve: Curves.easeIn,
        duration: Durations.medium1,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
            gap: 10,
            icon: Icons.home_filled,
            text: 'Home',
            textStyle: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          GButton(
            gap: 10,
            icon: Icons.info_rounded,
            text: 'About us',
            textStyle: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
