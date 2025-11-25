import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ram_cinemas/screens/Menu/about_page.dart';
import 'package:ram_cinemas/screens/Menu/locations_page.dart';
import 'package:ram_cinemas/screens/Menu/offers_page.dart';
import 'package:ram_cinemas/screens/Menu/signout_page.dart';
import 'package:ram_cinemas/screens/Menu/terms_conditions_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class SideBar extends StatefulWidget {
  final VoidCallback? onClose;
  const SideBar({super.key, this.onClose});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String selectedItem = "MOVIES";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Background Blur Effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(color: Colors.black.withOpacity(0.15)),
            ),
          ),

          // Actual Sidebar
          Container(
            width: 292,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: AppColours.darkGrey,
              boxShadow: [
                BoxShadow(
                  color: AppColours.black29,
                  blurRadius: 50,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Close Button
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 28,
                        color: AppColours.white,
                      ),
                      onPressed: widget.onClose ?? () => Navigator.pop(context),
                    ),
                  ),

                  // RAM Logo
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 130,
                      height: 92.7,
                      child: Image.asset(
                        "assets/images/RAM_Logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Divider Line
                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      width: 244,
                      height: 1,
                      decoration: BoxDecoration(
                        color: AppColours.mustard,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Menu Items
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _menuTile("assets/images/movie.svg", "MOVIES", () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const OffersPage(),
                            //   ),
                            // );
                          }),
                          _menuTile(
                            "assets/images/offer.svg",
                            "OFFERS & GIVEAWAYS",
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OffersPage(),
                                ),
                              );
                            },
                          ),
                          _menuTile(
                            "assets/images/location.svg",
                            "LOCATIONS",
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LocationsPage(),
                                ),
                              );
                            },
                          ),
                          _menuTile("assets/images/about.svg", "ABOUT", () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutPage(),
                              ),
                            );
                          }),

                          _menuTile(
                            "assets/images/security.svg",
                            "TERMS & CONDITIONS",
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TermsAndConditionsPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Sign Out Section
                  Container(
                    // width: 292,
                    height: 81,
                    decoration: BoxDecoration(
                      color: AppColours.black,
                      boxShadow: [
                        BoxShadow(
                          color: AppColours.black29,
                          blurRadius: 50,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignOutPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/logout.svg",
                              width: 22,
                              height: 22,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              "SIGN OUT",
                              style: TextStyles.size16Promptmedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Menu Tile Widget
  Widget _menuTile(String iconPath, String title, VoidCallback onTap) {
    final bool isSelected = selectedItem == title;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: InkWell(
        onTap: () {
          setState(() => selectedItem = title);
          onTap();
        },
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: 20, height: 20),
            const SizedBox(width: 14),
            Text(
              title,
              style: TextStyles.size16Promptmedium.copyWith(
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show Sidebar
void showSidebar(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.4),
    barrierDismissible: true,
    barrierLabel: "Sidebar",
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.centerLeft,
        child: SideBar(onClose: () => Navigator.pop(context)),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOut)),
        child: child,
      );
    },
  );
}
