import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/LightText.dart';
import 'package:coffeeshop_ui/Item_List.dart';
import 'package:coffeeshop_ui/Head_Nav.dart';
import 'package:coffeeshop_ui/HomePage.dart';

// Widget used
// _likedCard(CoffeeItem item)

// Shared Instance similar to Cart Manager
class LikedManager {
  LikedManager._(); // private constructor
  static final LikedManager instance = LikedManager._();

  final List<CoffeeItem> items = []; // holds every liked coffee

  // true/false check

  bool isLiked(CoffeeItem item) {
    return items.any((i) => i.name == item.name);
  }

  // if liked remove if not add
  void toggle(CoffeeItem item) {
    if (isLiked(item)) {
      items.removeWhere((i) => i.name == item.name);
    } else {
      items.add(item);
    }
  }

  // remove button
  void remove(CoffeeItem item) {
    items.removeWhere((i) => i.name == item.name);
  }
}

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  Widget build(BuildContext context) {
    final items = LikedManager.instance.items;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1512),
      body: SafeArea(
        child: Column(
          children: [
            Header(), // header

            Expanded(
              child: items.isEmpty
                  ? Center(
                      child: LightText(
                        text: 'No liked items yet',
                        size: 16,
                        color: Colors.white54,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return _likedCard(items[index]);
                      },
                    ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavBar(
        currentIndex: 2, // highlights the heart
        onTap: (index) {
          if (index == 0) {
            //go back to HomePage
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
            );
          }
        },
      ),
    );
  }

  Widget _likedCard(CoffeeItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFD9A66C).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(text: item.name, size: 17, color: Colors.white),
                LightText(
                  text: item.description,
                  size: 12,
                  color: Colors.white54,
                ),
                const SizedBox(height: 6),
                BoldText(
                  text: '\$${item.price.toStringAsFixed(2)}',
                  size: 15,
                  color: const Color(0xFFD9A66C),
                ),
              ],
            ),
          ),
          // deletes just this item, then refreshes the list
          GestureDetector(
            onTap: () {
              setState(() {
                LikedManager.instance.remove(item);
              });
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.delete_outline,
                size: 18,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
