import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/main_button.dart';
import 'package:ram_cinemas/components/text_form_field.dart';
import 'package:ram_cinemas/utils/text_styles.dart';
import 'package:ram_cinemas/utils/app_colours.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: CustomAppBar(title: "CHANGE PASSWORD", showBackArrow: true),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New Password Label
            Text("New password", style: TextStyles.size14Promptlight),
            const SizedBox(height: 5),

            // New Password Field
            CustomTextFormField(
              hintText: "Type your new password",
              controller: newPasswordController,
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // Confirm Password Label
            Text("Confirm password", style: TextStyles.size14Promptlight),
            const SizedBox(height: 5),

            // Confirm Password Field
            CustomTextFormField(
              hintText: "Re-enter your password",
              controller: confirmPasswordController,
              obscureText: true,
            ),

            const SizedBox(height: 400),

            // Save Button
            MainButton(
              title: "SAVE",
              onTap: () {
                if (newPasswordController.text !=
                    confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Passwords do not match")),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Password updated successfully!"),
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
