import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/main_button.dart';
import 'package:ram_cinemas/components/text_form_field.dart';
import 'package:ram_cinemas/screens/Menu/terms_conditions_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController firstNameController = TextEditingController(
    text: "Kanchani",
  );
  final TextEditingController lastNameController = TextEditingController(
    text: "Rathnayake",
  );
  final TextEditingController emailController = TextEditingController(
    text: "kanchanirathnayake@gmai.com",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "07771287198",
  );
  final TextEditingController addressController = TextEditingController(
    text: "27/2, New Hospital Road,\nKurunegala, Sri Lanka",
  );
  final TextEditingController nicController = TextEditingController(
    text: "211201209120123V",
  );

  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: CustomAppBar(title: "EDIT PROFILE", showBackArrow: true),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: firstNameController,
              hintText: "First Name",
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              controller: lastNameController,
              hintText: "Last Name",
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              controller: phoneController,
              hintText: "Phone Number",
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              controller: addressController,
              hintText: "Address",
              maxLines: 3,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              controller: nicController,
              hintText: "NIC Number",
            ),

            const SizedBox(height: 30),

            // Gender Section
            Row(
              children: [
                Text("Gender", style: TextStyles.size14Promptlight),
                const SizedBox(width: 50),

                // Male
                GestureDetector(
                  onTap: () => setState(() => gender = "Male"),
                  child: Row(
                    children: [
                      // Custom Gold Radio
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColours.gold, width: 2),
                        ),
                        child: gender == "Male"
                            ? Center(
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: AppColours.gold,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 10),
                      const Text("Male", style: TextStyles.size14Promptlight),
                    ],
                  ),
                ),

                const SizedBox(width: 40),

                // Female
                GestureDetector(
                  onTap: () => setState(() => gender = "Female"),
                  child: Row(
                    children: [
                      // Custom Gold Radio
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColours.gold, width: 2),
                        ),
                        child: gender == "Female"
                            ? Center(
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: AppColours.gold,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 10),
                      const Text("Female", style: TextStyles.size14Promptlight),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 120),

            /// Save Button
            MainButton(
              title: "SAVE",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsAndConditionsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
