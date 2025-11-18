import 'package:flutter/material.dart';
import 'package:ram_cinemas/screens/account_screens/login_page.dart';
import '../utils/app_colours.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Viewport size
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          // Design size
          const designWidth = 412.0;
          const designHeight = 892.0;

          // Scale factors
          final w = screenWidth / designWidth;
          final h = screenHeight / designHeight;

          return Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Image.asset(
                'assets/images/background_image.png',
                fit: BoxFit.cover,
              ),

              // Centered logo
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 24 * h),

                    Image.asset(
                      'assets/images/RAM_Logo.png',

                      width: 200 * w,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: 16 * h),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
