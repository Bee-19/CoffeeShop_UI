import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/LightText.dart';
import 'package:coffeeshop_ui/Item_List.dart';
import 'package:coffeeshop_ui/CoffeeDetailPage.dart';

class Home_Tile2 extends StatelessWidget {
  Home_Tile2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: coffeeItems.map((item) {
        // Image and description container
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoffeeDetailPage(item: item),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xFFD9A66C).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Side
                      Container(
                        height: 180,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item.imagePath),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.grey.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // Text Side
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoldText(
                            text: item.dialogue,
                            size: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          BoldText(text: "Your Perfect Cup Awaits.", size: 14),
                          SizedBox(height: 10),
                          // Coffees and price
                          LightText(
                            text: item.name,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(height: 3),
                          LightText(
                            text: item.description,
                            size: 10,
                            color: Colors.white70,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Row(
                                children: [
                                  LightText(
                                    text: ' \$',
                                    size: 20,
                                    color: Colors.orange.withValues(alpha: 0.7),
                                  ),
                                  SizedBox(width: 8),
                                  LightText(
                                    text: item.price.toStringAsFixed(2),
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  //  SizedBox(width: 80),
                                ],
                              ),
                              // Container(
                              //   child: Icon(
                              //     Icons.add,
                              //     size: 20,
                              //     color: Colors.white,
                              //   ),
                              //   height: 30,
                              //   width: 30,
                              //   decoration: BoxDecoration(
                              //     color: Color(0xFFD9A66C)
                              //         .withValues(alpha: 0.6),
                              //     borderRadius: BorderRadius.circular(10),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
