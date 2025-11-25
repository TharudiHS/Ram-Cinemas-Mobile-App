import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // APP BAR
      appBar: CustomAppBar(title: "ABOUT"),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
      body: Stack(
        children: [
          //  Main Scroll Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITLE
                Text(
                  "RAM CINEMAS – WATTALA",
                  style: TextStyles.size20Promptwhite,
                ),
                const SizedBox(height: 30),

                // IMAGE WITH BLUR SHADOW
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  IMAGE
                    Container(
                      width: 96,
                      height: 143,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/headoffice.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),

                          Text(
                            "HEAD OFFICE",
                            style: TextStyles.size12Promptmedium,
                          ),

                          const SizedBox(height: 1),

                          Text(
                            "RAM CINEMAS: WATTALA, NO 441,\n"
                            "NEGOMBO ROAD,\n"
                            "WATTALA, SRI LANKA.",
                            style: TextStyles.size12PromptmediumgreyLight
                                .copyWith(height: 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // CUSTOMER SERVICE
                Text("CUSTOMER SERVICE", style: TextStyles.size20Promptwhite),
                const SizedBox(height: 25),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hotline :  ", style: TextStyles.size14Promptlight),
                    Expanded(
                      child: Text(
                        "0114 425 425",
                        style: TextStyles.size14Promptlightgold.copyWith(
                          color: AppColours.gold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email :  ", style: TextStyles.size14Promptlight),
                    Expanded(
                      child: Text(
                        "feedback@ramcinemas.com.my",
                        style: TextStyles.size14Promptlightgold.copyWith(
                          color: AppColours.gold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // DESCRIPTION PARAGRAPH
                Text(
                  "Welcome to Ram Cinemas, the premier destination for cinematic experiences in Wattala, Sri Lanka. Established with the vision of redefining entertainment, Ram Cinemas offers state-of-the-art facilities, combining cutting-edge technology with exceptional customer service. Our modern theater boasts high-definition digital screens, immersive surround sound systems, and comfortable seating, ensuring every movie-goer enjoys a truly unforgettable viewing experience. Conveniently located in the heart of Wattala, we cater to a diverse audience, presenting the latest blockbuster hits, family-friendly features, and locally produced films that celebrate Sri Lankan talent.",
                  style: TextStyles.size14Promptlight.copyWith(height: 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
