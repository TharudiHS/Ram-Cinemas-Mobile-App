import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class LocationsInnerPage extends StatelessWidget {
  const LocationsInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: CustomAppBar(title: "LOCATIONS", showBackArrow: true),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  HEAD OFFICE SECTION
            Text("RAM CINEMAS – WATTALA", style: TextStyles.size20Promptwhite),

            const SizedBox(height: 15),

            _infoRow(
              "ADDRESS",
              "RAM CINEMAS, WATTALA, NO 441, NEGOMBO ROAD, WATTALA, SRI LANKA.",
            ),
            const SizedBox(height: 10),
            _infoRow("PHONE", "   0114 425 425 / 071 1200 220"),
            const SizedBox(height: 10),
            _infoRow("EMAIL", "    info.ramcinemas@gmail.com"),

            const SizedBox(height: 15),

            // HEAD OFFICE IMAGE
            Container(
              width: 364,
              height: 179,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColours.gold4D, width: 1),
                image: const DecorationImage(
                  image: AssetImage("assets/images/headoffice2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Text(
              "In the heart of Wattala, Ram Cinema promises an unforgettable cinematic experience that will ignite your senses. The theater is an abode of captivating movies, where you can delve into the world of imagination and immerse ...",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),

            const SizedBox(height: 20),

            //   SCREEN CARDS
            _screenCard(
              title: "RAM CINEMAS – WATTALA | \nSCREEN 01",
              imagePath: "assets/images/screen01.png",
            ),

            const SizedBox(height: 20),

            _screenCard(
              title: "RAM CINEMAS – WATTALA | \nSCREEN 02",
              imagePath: "assets/images/screen02.png",
            ),

            const SizedBox(height: 20),

            _screenCard(
              title: "RAM CINEMAS – WATTALA | \nSCREEN 03",
              imagePath: "assets/images/screen03.png",
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // REUSABLE WIDGETS

  Widget _infoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label: ", style: TextStyles.size12Promptmedium),
        const SizedBox(width: 6),
        Expanded(
          child: Text(value, style: TextStyles.size12PromptmediumgreyLight),
        ),
      ],
    );
  }

  // THE SCREEN CARD
  Widget _screenCard({required String title, required String imagePath}) {
    return Container(
      width: 367,
      height: 703,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColours.gold, width: 0.5),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.size20Promptwhite,
            ),
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
            width: 364,
            height: 179,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0x4DD9A935), width: 1),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: [
              _tag("2D"),
              _tag("3D"),
              _tag("Dolby Atmos"),
              _tag("5.1"),
              _tag("7.1"),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            "In the heart of Wattala, Ram Cinema promises an unforgettable cinematic experience that will ignite your senses. The theater is an abode of captivating movies, where you can delve into the world of imagination and immerse yourself in stories that come alive on the big screen",
            style: TextStyles.size14Promptlight.copyWith(height: 2.2),
          ),

          const SizedBox(height: 25),

          Text("Seating Capacity - 300", style: TextStyles.size14Promptlight),

          const SizedBox(height: 25),

          Text("Projector - Laser", style: TextStyles.size14Promptlight),
        ],
      ),
    );
  }

  Widget _tag(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 9),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Text(text, style: TextStyles.size12PromptmediumgreyLight),
    );
  }
}
