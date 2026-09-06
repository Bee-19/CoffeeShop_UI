import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/Home_Tile.dart';
import 'package:coffeeshop_ui/Home_Tile2.dart';
import 'package:coffeeshop_ui/Item_List.dart';
import 'package:coffeeshop_ui/CartPage.dart';

import 'Head_Nav.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //Icon(Icons.apps_outlined, size: 30)
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Head_Nav file
        bottomNavigationBar: NavBar(
          currentIndex: 0,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            }
          },
        ),
        // Gives Access to Scrolling
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BoldText(
                        size: 36,
                        text: 'Where your coffee \n cravings meet',
                        color: Color(0xFFD9A66C),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                // Serach bar container
                child: Padding(
                  padding: EdgeInsets.only(left: 7.0),
                  child: Row(
                    children: [
                      //sized box for spacing
                      SizedBox(width: 10),
                      //Icon
                      Icon(Icons.search, size: 30, color: Colors.white70),
                      SizedBox(width: 7),
                      // Field for search
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search for Coffee....',
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              //list view for coffee items
              Container(
                height: 100,
                width: double.infinity,

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 8),
                  itemCount: coffeeItems.length,
                  separatorBuilder: (context, index) => SizedBox(width: 30),
                  itemBuilder: ((context, index) {
                    return Container(
                      child: Center(
                        child: BoldText(
                          text: coffeeItems[index].name,
                          size: 18.5,
                          color: index == 1
                              ? Color(0xFF8B5A2B)
                              : Color(0xFF8B5A2B).withValues(alpha: 0.4),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // Taken from the Home_tile
              Home_Tile(),
              SizedBox(height: 20),
              BoldText(text: "Special For You", size: 25, color: Colors.white),
              SizedBox(height: 15),
              Home_Tile2(),
            ],
          ),
        ),
      ),
    );
  }
}
