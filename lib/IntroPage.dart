import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';

// ignore: unused_import
import 'package:coffeeshop_ui/LightText.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intro Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image
          Center(child: Image.asset('assets/coffee_intro.png')),
          SizedBox(height: 30),
          // container for reaching home page
          Container(
            width: 300,
            height: 70,
            color: Colors.white,
            child: BoldText(text: 'Home Page', color: Colors.black),
          ),
        ],
      ),
    );
  }
}
