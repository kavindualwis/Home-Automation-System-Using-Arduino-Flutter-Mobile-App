// ignore_for_file: avoid_print, must_be_immutable

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_automation01/Models/top_card.dart';
import 'package:home_automation01/Models/widget.dart';
import 'package:home_automation01/Providers/theme_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final String espIp = "192.168.xx.xx"; //Replace your ESP Board IP addresses

  bool mainLight = false; //Main light

  bool tableLamp = false; //Table lamp

  bool isDoorOpen = false; //Door

  bool isSleep = false; //Blue light

  bool themeToggle = true; //Theme toggle

  //Module IP assign
  Future<void> sendRequest(String endpoint) async {
    final url = Uri.parse("http://$espIp$endpoint");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print("Success: ${response.body}");
      } else {
        print("Failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Request error: $e");
    }
  }

  //Toast Message
  void showToast(String message, String image, Color color) {
    DelightToastBar(
      position: DelightSnackbarPosition.top,
      autoDismiss: true,
      snackbarDuration: const Duration(milliseconds: 1200),
      animationDuration: const Duration(milliseconds: 500),
      builder: (context) => ToastCard(
        color: color,
        leading: Image.asset(
          image,
          width: 40,
          height: 40,
        ),
        title: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      // Animation will take 300 ms
    ).show(context);
  }

  //Main Light Controll
  void mainLightControll(bool value) {
    setState(() {
      mainLight = value;
    });
    sendRequest(value ? "/led_white/on" : "/led_white/off");
    showToast(
      value ? "Main Light Turned On" : "Main Light Turned Off",
      value ? "images/lighton.png" : "images/lightoff.png",
      Colors.teal.withOpacity(0.9),
    );
  }

  //Table Lamp Controll
  void tableLampControll(bool value) {
    setState(() {
      tableLamp = value;
    });
    sendRequest(value ? "/led_orange/on" : "/led_orange/off");
    showToast(
      value ? "Study Lamp Turned On" : "Study Light Turned Off",
      value ? "images/lighton.png" : "images/lightoff.png",
      const Color.fromARGB(255, 246, 190, 38).withOpacity(0.9),
    );
  }

  //Sleeping Light Controll
  void sleepingLightControll(bool value) {
    setState(() {
      isSleep = value;
    });
    sendRequest(value ? "/led_blue/on" : "/led_blue/off");
    showToast(
      value ? "Sleeping Light Turned On" : "Sleeping Light Turned Off",
      value ? "images/lighton.png" : "images/lightoff.png",
      const Color.fromARGB(255, 2, 88, 159).withOpacity(0.9),
    );
  }

  //Door Controll
  void doorControll(bool value) {
    setState(() {
      isDoorOpen = value;
    });
    sendRequest(value ? "/door/open" : "/door/close");
    showToast(
      value ? "Door Opened" : "Door Closed",
      value ? "images/door-open1.png" : "images/door-close.png",
      Colors.deepPurple.withOpacity(0.9),
    );
  }

  //Datetime
  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Status Bar/Greeting
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getGreetingMessage(),
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Hey,",
                                style: GoogleFonts.poppins(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixed,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                " Alwis👋",
                                style: GoogleFonts.poppins(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixed,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        },
                        child: CircleAvatar(
                          radius: 28,
                          child: Icon(
                            Provider.of<ThemeProvider>(context).isDarkMode
                                ? Icons.nightlight
                                : Icons.sunny,
                            size: 35,
                            color:
                                Provider.of<ThemeProvider>(context).isDarkMode
                                    ? Colors.deepPurple
                                    : Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const TopCard(),

                  const SizedBox(height: 20),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //White Light Widget
                          MainWidget(
                            mainText: "Smart Lighting",
                            secondaryText: "Bedroom",
                            imagePath: mainLight
                                ? "images/lamp-on.png"
                                : "images/lamp-off.png",
                            secondImagePath: "images/wifi.png",
                            color: Colors.teal,
                            onChanged: mainLightControll,
                            isOn: mainLight,
                            text: mainLight ? "On" : "Off",
                          ),

                          //Table Lamp Light Widget
                          MainWidget(
                            mainText: "Study Mode",
                            secondaryText: "Study, Music",
                            imagePath: tableLamp
                                ? "images/desk-lamp-on.png"
                                : "images/tlamp-off.png",
                            secondImagePath: "images/wifi.png",
                            color: const Color.fromARGB(255, 245, 186, 25),
                            onChanged: tableLampControll,
                            isOn: tableLamp,
                            text: tableLamp ? "On" : "Off",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Sleeping Light Widget
                          MainWidget(
                            mainText: "Sleeping Mode",
                            secondaryText: "Sleeping Light",
                            imagePath: isSleep
                                ? "images/sleep.png"
                                : "images/not-sleeping.png",
                            secondImagePath: "images/wifi.png",
                            color: const Color.fromARGB(255, 2, 88, 159),
                            onChanged: sleepingLightControll,
                            isOn: isSleep,
                            text: isSleep ? "On" : "Off",
                          ),

                          //Door Controll Widget
                          MainWidget(
                            mainText: "Door Control",
                            secondaryText: "Smart Door",
                            imagePath: isDoorOpen
                                ? "images/door-open.png"
                                : "images/door-close.png",
                            secondImagePath: "images/wifi.png",
                            color: Colors.deepPurple,
                            onChanged: doorControll,
                            isOn: isDoorOpen,
                            text: isDoorOpen ? "Opened" : "Closed",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
