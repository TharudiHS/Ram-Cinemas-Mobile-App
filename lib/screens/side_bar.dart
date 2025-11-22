import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class SideBar extends StatelessWidget {
  final VoidCallback? onClose;

  const SideBar({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 292,
        height: MediaQuery.of(context).size.height,
        color: AppColours.almostBlack.withOpacity(0.9),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close Button
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: AppColours.white,
                      size: 28,
                    ),
                    onPressed: onClose ?? () => Navigator.pop(context),
                  ),
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
              const SizedBox(height: 15),
              Center(
                child: Container(
                  width: 244,
                  height: 1,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8E6B17),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Menu Items (Scrollable)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _menuTile("assets/images/movie.svg", "MOVIES", () {}),
                      _menuTile(
                        "assets/images/offer.svg",
                        "OFFERS & GIVEAWAYS",
                        () {},
                      ),
                      _menuTile(
                        "assets/images/location.svg",
                        "LOCATIONS",
                        () {},
                      ),
                      _menuTile("assets/images/about.svg", "ABOUT", () {}),
                      _menuTile(
                        "assets/images/security.svg",
                        "TERMS & CONDITIONS",
                        () {},
                      ),
                    ],
                  ),
                ),
              ),

              // Sign Out Button at Bottom
              Container(
                width: 292,
                height: 81,
                color: AppColours.black,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/logout.svg",
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "SIGN OUT",
                          style: TextStyles.size16Promptmedium.copyWith(
                            color: AppColours.white,
                          ),
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
    );
  }

  // Menu Tile Widget
  Widget _menuTile(String iconPath, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              placeholderBuilder: (context) =>
                  const SizedBox(width: 20, height: 20),
            ),
            const SizedBox(width: 14),
            Text(
              title,
              style: TextStyles.size16Promptmedium.copyWith(
                color: AppColours.gold,
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
