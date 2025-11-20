import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/main_button.dart';
import 'package:ram_cinemas/components/text_form_field.dart';
import 'package:ram_cinemas/screens/account_screens/login_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                "assets/images/background_image.avif",
                fit: BoxFit.cover,
              ),
            ),

            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  Back Arrow + Title
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColours.gold,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "REGISTRATION",
                        style: TextStyles.size16Promptmedium,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "ENTER YOUR DETAILS BELOW TO REGISTER",
                    style: TextStyles.size16Promptmediumwhite,
                  ),

                  const SizedBox(height: 25),

                  // FORM FIELDS
                  CustomTextFormField(hintText: "First name"),
                  const SizedBox(height: 18),

                  CustomTextFormField(hintText: "Second name"),
                  const SizedBox(height: 18),

                  CustomTextFormField(hintText: "Email address"),
                  const SizedBox(height: 18),

                  CustomTextFormField(hintText: "Mobile number"),
                  const SizedBox(height: 18),

                  CustomTextFormField(hintText: "Address", maxLines: 3),
                  const SizedBox(height: 18),

                  CustomTextFormField(hintText: "NIC number"),
                  const SizedBox(height: 18),

                  // Gender Section
                  Row(
                    children: [
                      Text("Gender", style: TextStyles.size14Promptlight),
                      const SizedBox(width: 20),

                      // Male
                      Row(
                        children: [
                          Radio(
                            activeColor: AppColours.gold,
                            value: "Male",
                            groupValue: gender,
                            onChanged: (val) {
                              setState(() => gender = val!);
                            },
                          ),
                          const Text(
                            "Male",
                            style: TextStyles.size14Promptlight,
                          ),
                        ],
                      ),

                      const SizedBox(width: 20),

                      // Female
                      Row(
                        children: [
                          Radio(
                            activeColor: AppColours.gold,
                            value: "Female",
                            groupValue: gender,
                            onChanged: (val) {
                              setState(() => gender = val!);
                            },
                          ),
                          const Text(
                            "Female",
                            style: TextStyles.size14Promptlight,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(hintText: "Password", obscureText: true),
                  const SizedBox(height: 18),

                  CustomTextFormField(
                    hintText: "Confirm password",
                    obscureText: true,
                  ),

                  const SizedBox(height: 20),

                  // Already have account? Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyles.size14Promptlight,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyles.size14Promptlightyellow,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Create Account Button
                  MainButton(
                    title: "CREATE ACCOUNT",
                    onTap: () {
                      print("Login pressed");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
