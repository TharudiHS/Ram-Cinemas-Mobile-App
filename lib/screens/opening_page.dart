import 'package:flutter/material.dart';
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
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const LoginPage()),
      // );
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

          // Design size
          const designWidth = 412;

          // Scale factors
          final w = screenWidth / designWidth;

          return Stack(
            fit: StackFit.expand,
            children: [
              // Background
              Image.asset(
                'assets/images/background_image.png',
                fit: BoxFit.cover,
              ),

              //Center Logo
              Center(
                child: Image.asset(
                  'assets/images/RAM_Logo.png',

                  width: 200 * w,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
