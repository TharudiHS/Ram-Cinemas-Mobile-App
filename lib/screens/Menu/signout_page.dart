import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class SignOutPage extends StatelessWidget {
  const SignOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkGrey,
      body: Stack(
        children: [
          //  Background
          _buildBackgroundContent(),

          //  Blur Layer
          _buildBlurLayer(),

          //  Popup
          _buildSignOutPopup(context),
        ],
      ),
    );
  }

  // Dummy background content
  Widget _buildBackgroundContent() {
    return const Center(
      child: Text(
        "Current Page Behind Blur",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  // Blur effect over the background
  Widget _buildBlurLayer() {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(color: Colors.black.withOpacity(0.4)),
      ),
    );
  }

  // Full sign-out popup widget
  Widget _buildSignOutPopup(BuildContext context) {
    return Center(
      child: Container(
        width: 365,
        height: 211,
        decoration: BoxDecoration(
          color: AppColours.darkGrey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColours.gold4D, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ARE YOU SURE",
                    style: TextStyles.size16Promptmediumwhite,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: AppColours.gold),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Do you want to Sign Out?",
                style: TextStyles.size16Promptregularwhite,
              ),

              const Spacer(),

              //  YES / NO Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  YES BUTTON
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 142,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColours.goldDark,
                            AppColours.goldLight,
                            AppColours.bronze,
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColours.black29,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "YES",
                          style: TextStyles.size16Promptsemibold,
                        ),
                      ),
                    ),
                  ),

                  // NO BUTTON
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 142,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColours.gold),
                        color: Colors.transparent,
                      ),
                      child: const Center(
                        child: Text(
                          "NO",
                          style: TextStyles.size16Promptsemiboldgold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
