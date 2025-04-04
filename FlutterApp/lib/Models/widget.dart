// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWidget extends StatelessWidget {
  void Function(bool)? onChanged;
  final String imagePath;
  final String secondImagePath;
  final String mainText;
  final String secondaryText;
  final Color color;
  final bool isOn;
  final String text;

  MainWidget({
    super.key,
    required this.mainText,
    required this.secondaryText,
    required this.imagePath,
    required this.onChanged,
    required this.secondImagePath,
    required this.color,
    required this.isOn,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 900),
      curve: Curves.decelerate,
      width: MediaQuery.of(context).size.width * 0.44,
      height: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: isOn
            ? LinearGradient(
                colors: [
                  color,
                  color.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [
                  color,
                  color.withOpacity(0.8),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imagePath,
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
                Image.asset(
                  secondImagePath,
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
              ],
            ),
            Text(
              mainText,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              secondaryText,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 190, 190, 190),
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isOn ? text : text,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                CupertinoSwitch(
                  value: isOn,
                  onChanged: onChanged,
                  activeColor: Colors.green,
                  trackColor: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
