import 'package:flutter/material.dart';
import 'package:ram_cinemas/screens/opening_page.dart';
import 'package:ram_cinemas/utils/app_theme.dart';

void main() {
  runApp(const RamCinemasApp());
}

class RamCinemasApp extends StatelessWidget {
  const RamCinemasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ram Cinemas App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OpeningPage(),
    );
  }
}
