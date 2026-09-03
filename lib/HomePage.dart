import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/LightText.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // ignore: non_constant_identifier_names
  List Names = ["Cappaccino", "Espresso", "Latte", "Americano", "Mocha"];
  //Icon(Icons.apps_outlined, size: 30)
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          // Gives Access to Scrolling
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  // Container for the main box
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
                      //SizedBox(width: 300), other option to seperate
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
                  child: BoldText(
                    size: 36,
                    text: 'Where your coffee \n cravings meet',
                    color: Color(0xFFD9A66C),
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
                    itemCount: Names.length,
                    separatorBuilder: (context, index) => SizedBox(width: 30),
                    itemBuilder: ((context, index) {
                      return Container(
                        child: Center(
                          child: BoldText(
                            text: Names[index],
                            size: 18.5,
                            color: index == 1
                                ? Color(0xFF8B5A2B)
                                : Color(0xFF8B5A2B).withValues(alpha: 0.4),
                          ),
                        ),
                      );
                    }),
                  ),
                ), //cut
                // Image Containers
                Container(
                  width: double.maxFinite,
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: // Image and description container
                            //SizedBox(height: 10),
                            Container(
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
                                          image: AssetImage(
                                            'assets/hot_ex.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.grey.withValues(
                                          alpha: 0.2,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // The Rating corner container
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 13,
                                          color: Colors.orange.withValues(
                                            alpha: 0.7,
                                          ),
                                        ),
                                        LightText(
                                          text: '4.5',
                                          size: 13,
                                          color: Colors.white70,
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: 10, left: 105),
                                    height: 20,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 109.5,
                                      left: 10.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LightText(
                                          text: 'Hot Espresso',
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        LightText(
                                          text: 'With Oat Milk',
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
                                                  color: Colors.orange
                                                      .withValues(alpha: 0.7),
                                                ),
                                                SizedBox(width: 8),
                                                LightText(
                                                  text: '4.50',
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
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
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// // Image and description container
//                 //SizedBox(height: 10),
//                 Container(
//                   height: 200,
//                   width: 160,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFD9A66C).withValues(alpha: 0.2),
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(
//                           height: 100,
//                           width: 200,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage('assets/hot_ex.jpg'),
//                               fit: BoxFit.cover,
//                             ),
//                             color: Colors.grey.withValues(alpha: 0.2),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         // The Rating corner container
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.star,
//                               size: 13,
//                               color: Colors.orange.withValues(alpha: 0.7),
//                             ),
//                             LightText(
//                               text: '4.5',
//                               size: 13,
//                               color: Colors.white70,
//                             ),
//                           ],
//                         ),
//                         margin: EdgeInsets.only(top: 10, left: 105),
//                         height: 20,
//                         width: 45,
//                         decoration: BoxDecoration(
//                           color: Colors.black.withValues(alpha: 0.3),
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(20),
//                             bottomLeft: Radius.circular(15),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 109.5, left: 10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             LightText(
//                               text: 'Hot Espresso',
//                               size: 20,
//                               color: Colors.white,
//                             ),
//                             LightText(
//                               text: 'With Oat Milk',
//                               size: 13,
//                               color: Colors.white70,
//                             ),
//                             SizedBox(height: 3),
//                             Row(
//                               children: [
//                                 Row(
//                                   children: [
//                                     LightText(
//                                       text: ' \$',
//                                       size: 20,
//                                       color: Colors.orange.withValues(
//                                         alpha: 0.7,
//                                       ),
//                                     ),
//                                     SizedBox(width: 8),
//                                     LightText(
//                                       text: '4.50',
//                                       size: 20,
//                                       color: Colors.white,
//                                     ),
//                                     SizedBox(width: 37),
//                                   ],
//                                 ),
//                                 Container(
//                                   child: Icon(
//                                     Icons.add,
//                                     size: 20,
//                                     color: Colors.white,
//                                   ),
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFFD9A66C)
//                                         .withValues(alpha: 0.6),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
