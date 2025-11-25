import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ram_cinemas/screens/Menu/offers_page.dart';
import 'package:ram_cinemas/screens/account_screens/login_page.dart';
import 'package:ram_cinemas/screens/account_screens/myaccount_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81,
      decoration: BoxDecoration(
        color: AppColours.darkGrey,
        border: const Border(top: BorderSide(color: AppColours.gold, width: 1)),
      ),
      child: ClipRect(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navItem(
              context,
              index: 0,
              icon: "assets/images/home-home-7.svg",
              isSelected: selectedIndex == 0,
              destination: const LoginPage(),
            ),
            _navItem(
              context,
              index: 1,
              icon: "assets/images/video-studio.svg",
              isSelected: selectedIndex == 1,
              destination: const LoginPage(),
            ),
            _navItem(
              context,
              index: 2,
              icon: "assets/images/offer-19.svg",
              isSelected: selectedIndex == 2,
              destination: const OffersPage(),
            ),
            _navItem(
              context,
              index: 3,
              icon: "assets/images/user-148.svg",
              isSelected: selectedIndex == 3,
              destination: const MyAccountPage(),
            ),
          ],
        ),
      ),
    );
  }

  // NAV ITEM
  Widget _navItem(
    BuildContext context, {
    required int index,
    required String icon,
    required bool isSelected,
    required Widget destination,
  }) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => destination),
          );
        }
      },
      child: SvgPicture.asset(
        icon,
        height: 25,
        width: 25,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColours.gold : AppColours.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
