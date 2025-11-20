import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ram_cinemas/components/main_button.dart';
import 'package:ram_cinemas/components/text_form_field.dart';
import 'package:ram_cinemas/screens/account_screens/forget_password_page.dart';
import 'package:ram_cinemas/screens/account_screens/myaccount_page.dart';
import 'package:ram_cinemas/screens/account_screens/registration_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  height: 337,
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
                        "LOGIN",
                        style: TextStyles.size20Eurostileregular,
                      ),

                      const SizedBox(height: 30),

                      //  EMAIL FIELD
                      const CustomTextFormField(hintText: "Email address"),

                      const SizedBox(height: 15),

                      //  PASSWORD FIELD
                      const CustomTextFormField(
                        hintText: "Password",
                        obscureText: true,
                      ),

                      const SizedBox(height: 20),

                      // FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Forget Password",
                            style: TextStyles.size12Promptregular,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // LOGIN BUTTON
                      MainButton(
                        title: "LOGIN",
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyAccountPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                //OR DIVIDER
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 1,
                      color: const Color(0xFF9A9A9A),
                    ),
                    const SizedBox(width: 8),
                    const Text("OR", style: TextStyles.size14Promptregular),
                    const SizedBox(width: 8),
                    Container(
                      width: 150,
                      height: 1,
                      color: const Color(0xFF9A9A9A),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // GOOGLE BUTTON
                SvgPicture.asset(
                  "assets/images/google.svg",
                  width: 32,
                  height: 32,
                ),

                const SizedBox(height: 20),

                // CREATE NEW
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't you have an account yet? ",
                      style: TextStyles.size14Promptlight,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create New",
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
