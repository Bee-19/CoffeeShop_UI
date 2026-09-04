import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/LightText.dart';
import 'package:coffeeshop_ui/Home_Tile.dart';
import 'package:coffeeshop_ui/Home_Tile2.dart';
import 'package:coffeeshop_ui/Item_List.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //Icon(Icons.apps_outlined, size: 30)
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF12100D), // one shade darker than 0xFF1A1512
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: const Color(0xFFD9A66C), // your caramel accent
            unselectedItemColor: Colors.white54,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 28),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined, size: 28),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: 28),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined, size: 28),
                label: '',
              ),
            ],
          ),
        ),
        // Gives Access to Scrolling
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF8B5A2B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.grid_view_rounded,
                        size: 28,
                        color: Colors.white70,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF8B5A2B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 28,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
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
