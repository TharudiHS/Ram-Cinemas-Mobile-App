import 'package:flutter/material.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MainButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 332,
        height: 46,
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
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(title, style: TextStyles.size18Promptsemibold),
      ),
    );
  }
}
