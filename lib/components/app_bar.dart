import 'package:flutter/material.dart';
import 'package:ram_cinemas/screens/Menu/side_bar.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackArrow;
  final VoidCallback? onMenuTap;
  final VoidCallback? onBackTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackArrow = false,
    this.onMenuTap,
    this.onBackTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(78);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      color: AppColours.almostBlack,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // MENU ICON
          GestureDetector(
            onTap: onMenuTap ?? () => showSidebar(context),
            child: const Icon(Icons.menu, color: AppColours.white, size: 30),
          ),

          const SizedBox(width: 20),

          //  BACK ARROW (Gold)
          if (showBackArrow)
            GestureDetector(
              onTap: onBackTap ?? () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColours.gold,
                size: 18,
              ),
            ),

          if (showBackArrow) const SizedBox(width: 12),

          // TITLE
          Text(title, style: TextStyles.size16Promptmedium),
        ],
      ),
    );
  }
}
