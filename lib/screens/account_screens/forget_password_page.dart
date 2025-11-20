import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/main_button.dart';
import 'package:ram_cinemas/components/text_form_field.dart';
import 'package:ram_cinemas/screens/account_screens/login_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              "assets/images/background_image.avif",
              fit: BoxFit.cover,
            ),
          ),

          //  BACKGROUND BLUR + BRIGHTNESS
          // Positioned.fill(
          //   // child: BackdropFilter(
          //   //   // filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          //   //   // child: Container(color: AppColours.black.withOpacity(0.70)),
          //   // ),
          // ),

          //  MAIN CONTENT
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),

                // RAM CINEMAS LOGO
                SizedBox(
                  width: 150,
                  height: 105.87,
                  child: Image.asset(
                    "assets/images/RAM_Logo.png",
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 40),

                //CENTER CARD
                Container(
                  width: 364,
                  height: 274,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColours.darkGrey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColours.black29,
                        blurRadius: 50,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "FORGET ",
                        style: TextStyles.size20Eurostileregular,
                      ),
                      const Text(
                        "PASSWORD",
                        style: TextStyles.size20Eurostileregular,
                      ),

                      const SizedBox(height: 30),

                      //  EMAIL FIELD
                      const CustomTextFormField(hintText: "Email address"),

                      const SizedBox(height: 20),

                      // SEND BUTTON
                      MainButton(
                        title: "SEND RESET LINK",
                        onTap: () {
                          print("Send pressed");
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // Sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Back to ", style: TextStyles.size14Promptlight),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyles.size14Promptlightyellow,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
