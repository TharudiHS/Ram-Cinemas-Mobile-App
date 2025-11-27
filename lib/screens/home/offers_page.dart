import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ram_cinemas/components/second_button.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class OffersPage extends StatelessWidget {
  OffersPage({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TITLE + ARROWS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("OFFERS", style: TextStyles.size20Eurostileregular),
              Row(
                children: [
                  _arrowButton("assets/images/left.svg", () {
                    _scrollController.animateTo(
                      _scrollController.offset - 200,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }),
                  const SizedBox(width: 10),
                  _arrowButton("assets/images/right.svg", () {
                    _scrollController.animateTo(
                      _scrollController.offset + 200,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // OFFER LIST
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              _buildOfferCard(
                context,
                image: "assets/images/offer1.png",
                description:
                    "SPECIAL OFFERS & EXCLUSIVE FOR VISA AND \nMASTER CARDS HOLDERS",
              ),
              const SizedBox(height: 20),

              _buildOfferCard(
                context,
                image: "assets/images/offer1.png",
                description:
                    "SPECIAL OFFERS & EXCLUSIVE FOR VISA AND \nMASTER CARDS HOLDERS",
              ),
              const SizedBox(height: 20),

              _buildOfferCard(
                context,
                image: "assets/images/offer1.png",
                description:
                    "SPECIAL OFFERS & EXCLUSIVE FOR VISA AND \nMASTER CARDS HOLDERS",
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  // ARROW BUTTON
  Widget _arrowButton(String svgPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(svgPath, width: 31.93, height: 31.93),
    );
  }

  //  OFFER CARD
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
          child: SecondButton(title: "VIEW OFFER", onTap: () {}),
        ),

        const SizedBox(height: 5),
      ],
    );
  }
}
