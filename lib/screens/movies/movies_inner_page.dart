import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/main_button.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class MovieInnerPage extends StatelessWidget {
  const MovieInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: CustomAppBar(title: "MOVIES", showBackArrow: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //MOVIE TITLE
            const Text("KANGUVA", style: TextStyles.size24Eurostileregular),

            const SizedBox(height: 12),

            const Text(
              "2024 | MUSICAL, THRILLER | 2D, 3D | 2HR 18MIN",
              style: TextStyles.size12PromptmediumgreyLight,
            ),

            const SizedBox(height: 16),

            // MOVIE IMAGE + PLAY BUTTON
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 364,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/kanguva_image.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // PLAY BUTTON OVERLAY
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: Image.asset("assets/images/play_button.png"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //  SYNOPSIS
            const Text("SYNOPSIS", style: TextStyles.size20Promptwhite),

            const SizedBox(height: 10),

            Text(
              "Struggling with his dual identity, failed comedian Arthur Fleck meets the love of his life, Harley Quinn, while incarcerated at Arkham State Hospital.",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),

            const SizedBox(height: 20),

            // DIRECTOR
            const Text("DIRECTOR", style: TextStyles.size20Promptwhite),

            const SizedBox(height: 10),

            const Text("Todd Phillips", style: TextStyles.size14Promptlight),
            const SizedBox(height: 20),

            // WRITERS
            const Text("WRITERS", style: TextStyles.size20Promptwhite),

            const SizedBox(height: 10),

            const Text(
              "Scott Silver, Todd Phillips, Bob Kane",
              style: TextStyles.size14Promptlight,
            ),
            const SizedBox(height: 20),

            // CAST
            const Text("CAST", style: TextStyles.size20Promptwhite),

            const SizedBox(height: 10),

            Text(
              "Joaquin Phoenix, Lady Gaga, Brendan Gleeson, Catherine Keener",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: MainButton(title: "BUY TICKETS", onTap: () {}),
          ),
          const BottomNavBar(selectedIndex: 1),
        ],
      ),
    );
  }
}
