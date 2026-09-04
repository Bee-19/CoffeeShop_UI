import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/LightText.dart';
import 'package:coffeeshop_ui/Item_List.dart';
import 'package:coffeeshop_ui/CoffeeDetailPage2.dart';

class CoffeeDetailPage extends StatefulWidget {
  final CoffeeItem item; // whichever coffee was tapped gets passed in here

  const CoffeeDetailPage({super.key, required this.item});

  @override
  State<CoffeeDetailPage> createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  bool isLiked = false; // like button state

  @override
  Widget build(BuildContext context) {
    final item = widget.item; // items file

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Stack(
              children: [
                Image.asset(
                  item.imagePath,
                  width: double.infinity,
                  height: 480,
                  fit: BoxFit.cover,
                ),

                // text on image
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          const Color(0xFF1A1512).withValues(alpha: 0.95),
                        ],
                      ),
                    ),
                  ),
                ),

                // back + like buttons
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // like button
                        GestureDetector(
                          onTap: () => setState(() => isLiked = !isLiked),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              size: 22,
                              color: isLiked ? Colors.red : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // the rest on image
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              text: item.name,
                              size: 28,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 4),
                            LightText(
                              text: item.description,
                              size: 15,
                              color: Colors.white70,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Color(0xFFD9A66C),
                                ),
                                const SizedBox(width: 4),
                                LightText(
                                  text: '${item.rating}',
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Column(
                        children: [
                          Row(
                            children: [
                              _Wdrop(item.tag1Icon),
                              const SizedBox(width: 8),
                              _Wdrop(item.tag2Icon),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _labelbox(item.roast),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CoffeeDetailPage2(item: item), // The rest of the code
          ],
        ),
      ),
    );
  }

  // functions for the icon widgets
  Widget _Wdrop(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 20, color: const Color(0xFFD9A66C)),
    );
  }

  Widget _labelbox(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );
  }
}
