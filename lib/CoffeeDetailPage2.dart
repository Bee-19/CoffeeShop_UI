import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/LightText.dart';
import 'package:coffeeshop_ui/Item_List.dart';

class CoffeeDetailPage2 extends StatefulWidget {
  final CoffeeItem item;

  const CoffeeDetailPage2({super.key, required this.item});

  @override
  State<CoffeeDetailPage2> createState() => _CoffeeDetailPage2State();
}

class _CoffeeDetailPage2State extends State<CoffeeDetailPage2> {
  int selectedSize = 0; // size selection
  final List<String> sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText(text: 'Description', size: 18, color: Colors.white),
          const SizedBox(height: 8),
          LightText(
            text: item.longDescription,
            size: 14,
            color: Colors.white54,
            textOverflow: TextOverflow.visible,
            maxLines: null,
          ),
          const SizedBox(height: 20),

          BoldText(text: 'Size', size: 18, color: Colors.white),
          const SizedBox(height: 10),
          Row(
            children: List.generate(sizes.length, (index) {
              final selected = selectedSize == index;
              return GestureDetector(
                onTap: () => setState(() => selectedSize = index),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selected
                          ? const Color(0xFFD9A66C)
                          : Colors.white24,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    sizes[index],
                    style: TextStyle(
                      color: selected
                          ? const Color(0xFFD9A66C)
                          : Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 30),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LightText(text: 'Price', size: 14, color: Colors.white54),
                  Row(
                    children: [
                      const Text(
                        '\$',
                        style: TextStyle(
                          color: Color(0xFFD9A66C),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.price.toStringAsFixed(2),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 🔻 hook your add-to-cart logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B5A2B),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
