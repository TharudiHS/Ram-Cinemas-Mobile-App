import 'package:flutter/material.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332,
      height: 46,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF000000),

          hintText: hintText,
          hintStyle: TextStyles.size16Promptregular,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColours.gold80, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColours.gold, width: 1),
          ),
        ),
      ),
    );
  }
}
