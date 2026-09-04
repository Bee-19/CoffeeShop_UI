import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/LightText.dart';
import 'package:coffeeshop_ui/Home_Tile.dart';
import 'package:coffeeshop_ui/Home_Tile2.dart';
import 'package:coffeeshop_ui/Item_List.dart';
import 'package:coffeeshop_ui/CoffeeDetailPage.dart';

class Home_Tile extends StatelessWidget {
  Home_Tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: coffeeItems.length,
        itemBuilder: (context, index) {
          final item = coffeeItems[index];
          return Expanded(
            child: // Image and description container
                //SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoffeeDetailPage(item: item),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    height: 200,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9A66C).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(item.imagePath),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.grey.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Container(
                          // The Rating corner container
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 13,
                                color: Colors.orange.withValues(alpha: 0.7),
                              ),
                              LightText(
                                text: item.rating.toString(),
                                size: 13,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(top: 10, left: 105),
                          height: 20,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 109.5, left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LightText(
                                text: item.name,
                                size: 20,
                                color: Colors.white,
                              ),
                              LightText(
                                text: item.description,
                                size: 13,
                                color: Colors.white70,
                              ),
                              SizedBox(height: 3),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      LightText(
                                        text: ' \$',
                                        size: 20,
                                        color: Colors.orange.withValues(
                                          alpha: 0.7,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      LightText(
                                        text: item.price.toStringAsFixed(2),
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 37),
                                    ],
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9A66C)
                                          .withValues(alpha: 0.6),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ), // same pasted in tile2
                        ),
                      ],
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }
}
