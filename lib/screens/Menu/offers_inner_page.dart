import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/main_button.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class OfferInnerPage extends StatelessWidget {
  const OfferInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: CustomAppBar(title: "OFFERS & GIVEAWAYS", showBackArrow: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SPECIAL OFFERS & EXCLUSIVE FOR\nVISA AND MASTER CARD HOLDERS",
              style: TextStyles.size20Promptwhite,
            ),

            const SizedBox(height: 20),

            // Offer Image
            Center(
              child: Image.asset(
                'assets/images/offer1.png',
                width: 364,
                height: 212,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            // VALID TILL
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("VALID TILL: ", style: TextStyles.size14Promptlightgold),
                Text("30 DEC 2024 23:59", style: TextStyles.size14Promptmeduim),
              ],
            ),

            const SizedBox(height: 24),

            // DESCRIPTION
            Text(
              "Get ready for double the fun with the Moana 2 Activity Pack or the Sticker Sheet Redemption! "
              "Dive into the enchanting world of Moana with an exciting activity pack filled with puzzles, "
              "coloring pages, and games inspired by the movie. Alternatively, choose the vibrant sticker "
              "sheet redemption and decorate your belongings with characters, scenes, and motifs from Moana's "
              "newest adventure. Whether you’re exploring your creativity or collecting your favorite characters, "
              "these goodies are perfect for fans of all ages to relive the magic of Moana 2!",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),

            const SizedBox(height: 24),

            Text("HOW TO GET OFFER", style: TextStyles.size20Promptwhite),
            const SizedBox(height: 12),
            Text(
              "To claim the Moana 2 Activity Pack or Sticker Sheet Redemption, follow these simple steps:",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),
            const SizedBox(height: 12),

            Text(
              "1. Purchase: Look for participating products or tickets that include the offer. Check for details on promotional packaging or websites.",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),
            const SizedBox(height: 8),

            Text(
              "2. Collect Proof: Save your receipt or proof of purchase as required.",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),
            const SizedBox(height: 8),

            Text(
              "3. Redeem: Visit the official redemption site or follow instructions provided in the offer, such as submitting your proof online or mailing it in.",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),
            const SizedBox(height: 8),

            Text(
              "4. Claim Your Reward: Once your submission is verified, your activity pack or sticker sheet will be sent to you.",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),
            const SizedBox(height: 8),

            Text(
              "Act fast—this offer is only available for a limited time, while supplies last!",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),

            const SizedBox(height: 24),

            Text("VALID ON", style: TextStyles.size20Promptwhite),
            const SizedBox(height: 12),
            Text(
              "Web & Mobile App only",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),

            const SizedBox(height: 24),

            Text("QUOTAS", style: TextStyles.size20Promptwhite),
            const SizedBox(height: 12),
            Text(
              "Limited",
              style: TextStyles.size14Promptlight.copyWith(height: 2),
            ),

            const SizedBox(height: 24),

            Text("OTHER CONDITIONS", style: TextStyles.size20Promptwhite),
            const SizedBox(height: 12),
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
          const BottomNavBar(selectedIndex: 2),
        ],
      ),
    );
  }
}
