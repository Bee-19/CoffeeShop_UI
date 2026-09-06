import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/LightText.dart';
import 'package:coffeeshop_ui/CartManager.dart';
import 'package:coffeeshop_ui/Head_Nav.dart';

// Widget used
// _cartCard(CartEntry entry, int index)
// _quantityStepper(CartEntry entry, int index)
// _stepBtn(IconData icon, VoidCallback onTap)
// _totalAndPayBar(List<CartEntry> entries)

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final Entry = CartManager.instance.Entry;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1512),
      body: SafeArea(
        child: Column(
          children: [
            // header
            Header(),
            Expanded(
              child: Entry.isEmpty
                  ? Center(
                      child: LightText(
                        text: 'Your cart is empty',
                        size: 16,
                        color: Colors.white54,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: Entry.length,
                      itemBuilder: (context, index) {
                        final entry = Entry[index];
                        return _cartCard(entry, index); // one row per entry
                      },
                    ),
            ),

            // Total price + Pay button
            _totalAndPayBar(Entry),
          ],
        ),
      ),

      // nav bar
      bottomNavigationBar: NavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) Navigator.pop(context); // tapping home icon goes back
        },
      ),
    );
  }

  // builds ONE cart row
  Widget _cartCard(CartEntry entry, int index) {
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
          // coffee image
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(entry.item.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(width: 12),

          // middle column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(text: entry.item.name, size: 17, color: Colors.white),
                LightText(
                  text: entry.item.description,
                  size: 12,
                  color: Colors.white54,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // show size
                    if (entry.size != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: LightText(
                          text: entry.size!, // ! tells Dart "trust me, this isn't null here"
                          size: 12,
                          color: Colors.white70,
                        ),
                      )
                    else
                      SizedBox.shrink(), // keeps layout stable

                    _quantityStepper(entry, index),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          //(price × quantity)
          BoldText(
            text: '\$${entry.total.toStringAsFixed(2)}',
            size: 16,
            color: Color(0xFFD9A66C),
          ),
        ],
      ),
    );
  }

  // the +/- button
  Widget _quantityStepper(CartEntry entry, int index) {
    return Row(
      children: [
        // minus button
        _stepBtn(Icons.remove, () {
          setState(() {
            if (entry.quantity > 1) {
              entry.quantity--; // just reduce the count
            } else {
              // remove the whole row when 0
              CartManager.instance.Entry.removeAt(index);
            }
          });
        }),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white24),
            borderRadius: BorderRadius.circular(8),
          ),
          child: LightText(
            text: '${entry.quantity}',
            size: 14,
            color: Colors.white,
          ),
        ),

        // plus button
        _stepBtn(Icons.add, () => setState(() => entry.quantity++)),
      ],
    );
  }

  // small reusable circular button
  Widget _stepBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          color: const Color(0xFF8B5A2B),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }

  // the bottom bar showing grand total + Pay button
  Widget _totalAndPayBar(List<CartEntry> Entry) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF12100D),
      ), // same shade as your nav bar
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LightText(text: 'Total Price', size: 13, color: Colors.white54),
              BoldText(
                text: '\$${CartManager.instance.totalPrice.toStringAsFixed(2)}',
                size: 22,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(width: 30),
          Expanded(
            child: ElevatedButton(
              // onPressed: null makes a button unclickable —
              onPressed: Entry.isEmpty
                  ? null
                  : () {
                      // 🔻 hook your real checkout/payment logic here later
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5A2B),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: BoldText(text: 'Pay', size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
