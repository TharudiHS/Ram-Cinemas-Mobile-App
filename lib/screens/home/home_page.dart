import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/second_button.dart';
import 'package:ram_cinemas/screens/home/nowshowing_page.dart';
import 'package:ram_cinemas/screens/home/offers_page.dart';
import 'package:ram_cinemas/screens/home/upcoming_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: const CustomAppBar(title: "HOME"),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),

      // BODY
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            //  BANNER
            _buildBannerSection(),

            const SizedBox(height: 25),

            //  NOW SHOWING
            NowShowingPage(),

            const SizedBox(height: 40),

            // UPCOMING
            UpcomingPage(),

            const SizedBox(height: 40),

            // OFFERS
            OffersPage(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // BANNER SECTION
  Widget _buildBannerSection() {
    // MINI GOLD LINE
    Widget miniGoldLine({required bool isActive}) {
      return Container(
        width: 26,
        height: 2,
        decoration: BoxDecoration(
          color: isActive ? AppColours.gold : AppColours.gold.withOpacity(0.25),
          borderRadius: BorderRadius.circular(5),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // MAIN BANNER
        Container(
          width: 364,
          height: 399,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              // BACKGROUND IMAGE
              Image.asset(
                "assets/images/slider.png",
                width: 364,
                height: 399,
                fit: BoxFit.cover,
              ),

              // LEFT ARROW
              Positioned(
                left: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/images/lft.svg", width: 27),
                  ),
                ),
              ),

              // RIGHT ARROW
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/images/rgt.svg", width: 27),
                  ),
                ),
              ),

              // TITLE + PLAY TRAILER
              Positioned(
                bottom: 140,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text("KANGUVA", style: TextStyles.size30Eurostileregular),

                    const SizedBox(height: 6),

                    // PLAY TRAILER
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/trailer.svg",
                            width: 11,
                            height: 11.01,
                          ),

                          const SizedBox(width: 6),
                          Text(
                            "Play Trailer",
                            style: TextStyles.size12Promptregular,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "ACTION, SCI-FI, DRAMA  |  2 HR 30 MIN  |  2D, 3D, DOLBY ATMOS  |  U/A",
                      textAlign: TextAlign.center,
                      style: TextStyles.size8Promptgold,
                    ),
                  ],
                ),
              ),

              //BUY TICKETS BUTTON
              Positioned(
                bottom: 70,
                left: 0,
                right: 0,
                child: Center(
                  child: SecondButton(title: "BUY TICKETS", onTap: () {}),
                ),
              ),

              //  MINI GOLD LINES
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    miniGoldLine(isActive: false),
                    const SizedBox(width: 8),
                    miniGoldLine(isActive: true),
                    const SizedBox(width: 8),
                    miniGoldLine(isActive: false),
                    const SizedBox(width: 8),
                    miniGoldLine(isActive: false),
                    const SizedBox(width: 8),
                    miniGoldLine(isActive: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
