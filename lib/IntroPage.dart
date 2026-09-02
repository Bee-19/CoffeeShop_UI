import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/HomePage.dart';

// ignore: unused_import
import 'package:coffeeshop_ui/LightText.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 150), //SizedBox for spacing
          // image
          Center(child: Image.asset('assets/coffee_intro.png')),
          // container for reaching home page
          GestureDetector(
            onTap: () {
              // Navigate to home page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xFFCBA083),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: BoldText(
                  size: 30,
                  text: 'Cup Awaits',
                  color: Color(0xFF3E2723),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
