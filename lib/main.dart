import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/IntroPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1512),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8B5A2B), // main brown accent
          secondary: Color(0xFFD9A66C), // tan/caramel accent
          surface: Color(0xFF1E1815),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
