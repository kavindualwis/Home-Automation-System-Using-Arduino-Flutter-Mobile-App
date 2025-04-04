import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopCard extends StatelessWidget {
  const TopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 0.2,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),

        //Card
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Image.asset(
                  "images/humidity.png",
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Humidity",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "75%",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const VerticalDivider(
              color: Color.fromARGB(255, 190, 190, 190),
              thickness: 0.5,
              width: 1,
            ),
            Row(
              children: [
                Image.asset(
                  "images/energy01.png",
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Energy",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "60kwh",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const VerticalDivider(
              color: Color.fromARGB(255, 190, 190, 190),
              thickness: 0.5,
              width: 1,
            ),
            Row(
              children: [
                Image.asset(
                  "images/temprature.png",
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 3),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Temp",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "24 C",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
