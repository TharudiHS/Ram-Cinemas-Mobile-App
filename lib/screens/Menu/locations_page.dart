import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/second_button.dart';
import 'package:ram_cinemas/screens/Menu/locations_inner_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: CustomAppBar(title: "LOCATIONS"),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),

      // BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Container(
            width: 364,
            height: 543,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColours.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColours.gold, width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TITLE
                const Text(
                  "RAM CINEMAS - WATTALA",
                  textAlign: TextAlign.center,
                  style: TextStyles.size20Promptwhite,
                ),

                const SizedBox(height: 20),

                // Divider Line
                Center(
                  child: Container(
                    width: 300,
                    height: 0.1,
                    decoration: BoxDecoration(color: AppColours.greyLight),
                  ),
                ),
                const SizedBox(height: 25),

                // IMAGE
                Container(
                  width: 324,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColours.gold80, width: 1),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/headoffice2.png"),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                //  FEATURES ROW
                Wrap(
                  spacing: 10,
                  children: [
                    _tag("2D"),
                    _tag("3D"),
                    _tag("Dolby Atmos"),
                    _tag("5.1"),
                    _tag("7.1"),
                  ],
                ),

                const SizedBox(height: 20),

                // GET DIRECTIONS
                const Text("GET DIRECTIONS", style: TextStyles.size12Prompt),

                const SizedBox(height: 16),

                //  DESCRIPTION
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "In the heart of Wattala, Ram Cinema promises an unforgettable cinematic experience that will ignite your senses. The theater is an abode of captivating movies, where you can delve...",
                    textAlign: TextAlign.center,
                    style: TextStyles.size14Promptlight.copyWith(height: 2),
                  ),
                ),

                const SizedBox(height: 6),

                // READ MORE BUTTON
                SizedBox(
                  child: SecondButton(
                    title: "READ MORE",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LocationsInnerPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _tag(String text) {
  return Container(
    margin: const EdgeInsets.only(right: 3),
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.white, width: 0.5),
    ),
    child: Text(text, style: TextStyles.size12PromptmediumgreyLight),
  );
}
