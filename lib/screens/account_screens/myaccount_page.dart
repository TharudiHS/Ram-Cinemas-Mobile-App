import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/screens/account_screens/change_password_page.dart';
import 'package:ram_cinemas/screens/account_screens/edit_profile_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: "MY ACCOUNT"),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
      body: Stack(
        children: [
          //  BACKGROUND IMAGE
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // PROFILE INFO TITLE
                Text(
                  "PROFILE INFORMATION",
                  style: TextStyles.size16Promptmediumwhite,
                ),
                const SizedBox(height: 20),

                // PROFILE DETAILS
                _buildRow("First Name:", "Kanchani"),
                _buildRow("Second Name:", "Rathnayake"),
                _buildRow("Email:", "kanchanirathnayake@gmail.com"),
                _buildRow("Mobile Number:", "07771287198"),
                _buildRow("Gender:", "Female"),
                _buildRow("NIC Number:", "211201209120123V"),
                _buildRow(
                  "Address:",
                  "27/2, New Hospital Road,\nKurunegala, Sri Lanka",
                ),

                const SizedBox(height: 10),

                //  EDIT PROFILE
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfilePage(),
                      ),
                    );
                  },
                  child: Text(
                    "Edit Profile",
                    style: TextStyles.size14Promptlightgold.copyWith(
                      color: AppColours.gold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Divider(
                  color: AppColours.greyDark.withOpacity(0.4),
                  thickness: 1,
                ),

                const SizedBox(height: 20),

                //  PRIVACY TITLE
                Text("PRIVACY", style: TextStyles.size16Promptmediumwhite),

                const SizedBox(height: 16),

                // PASSWORD FIELD
                _buildRow("Password:", "********"),

                const SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Change Password",
                    style: TextStyles.size14Promptlightgold.copyWith(
                      color: AppColours.gold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // REUSABLE ROW BUILDER WIDGET

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 132,
            child: Text(label, style: TextStyles.size14Promptlight),
          ),
          Expanded(child: Text(value, style: TextStyles.size14Promptmeduim)),
        ],
      ),
    );
  }
}
