import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/second_button.dart';
import 'package:ram_cinemas/screens/Menu/offers_inner_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: CustomAppBar(title: "OFFERS & GIVEAWAYS"),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            _buildOfferCard(
              context,
              image: "assets/images/offer1.png",
              description:
                  "SPECIAL OFFERS & EXCLUSIVE FOR VISA AND MASTER CARDS HOLDERS",
            ),
            const SizedBox(height: 20),

            _buildOfferCard(
              context,
              image: "assets/images/offer2.png",
              description:
                  "SPECIAL OFFERS & EXCLUSIVE FOR VISA AND MASTER CARDS HOLDERS",
            ),
            const SizedBox(height: 20),

            _buildOfferCard(
              context,
              image: "assets/images/offer3.png",
              description:
                  "SPECIAL OFFERS & EXCLUSIVE FOR VISA AND MASTER CARDS HOLDERS",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // OFFER CARD WIDGET

  Widget _buildOfferCard(
    BuildContext context, {
    required String image,
    required String description,
  }) {
    return Column(
      children: [
        // IMAGE CARD
        Container(
          width: 364,
          height: 212,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(image, fit: BoxFit.cover),
        ),

        const SizedBox(height: 12),

        // DESCRIPTION
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyles.size14Promptmeduim,
        ),

        const SizedBox(height: 10),

        // VIEW OFFER BUTTON
        SizedBox(
          child: SecondButton(
            title: "VIEW OFFER",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const OfferInnerPage()),
              );
            },
          ),
        ),

        const SizedBox(height: 5),
      ],
    );
  }
}
