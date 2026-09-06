import 'package:flutter/material.dart';
import 'package:coffeeshop_ui/BoldText.dart';
import 'package:coffeeshop_ui/LightText.dart';
import 'package:coffeeshop_ui/CartPage.dart';
import 'package:coffeeshop_ui/CartManager.dart';
import 'package:coffeeshop_ui/Head_Nav.dart';

// Widget used
// _addressSection()
// _openAddressDialog()
// _paymentMethodTile(String label, IconData icon, int index)
// _orderSummary(List<CartEntry> entries)
// _placeOrderBar()

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedMethod = 0;

  // no address has been entered yet
  String? deliveryAddress;

  final List<Map<String, dynamic>> paymentMethods = [
    {'label': 'Cash on Delivery', 'icon': Icons.money},
    {'label': 'Credit / Debit Card', 'icon': Icons.credit_card},
    {'label': 'Wallet', 'icon': Icons.account_balance_wallet},
  ];

  @override
  Widget build(BuildContext context) {
    final Entry = CartManager.instance.Entry;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1512),
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _addressSection(),
                    const SizedBox(height: 25),

                    BoldText(
                      text: 'Payment Method',
                      size: 18,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(paymentMethods.length, (index) {
                      return _paymentMethodTile(
                        paymentMethods[index]['label'],
                        paymentMethods[index]['icon'],
                        index,
                      );
                    }),
                    const SizedBox(height: 25),

                    BoldText(
                      text: 'Order Summary',
                      size: 18,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    _orderSummary(Entry),
                  ],
                ),
              ),
            ),
            _placeOrderBar(Entry),
          ],
        ),
      ),
    );
  }

  // Delivery address popup
  Widget _addressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoldText(text: 'Delivery Address', size: 18, color: Colors.white),
            GestureDetector(
              onTap: _openAddressDialog, // the popup form
              child: Text(
                deliveryAddress == null ? 'Add Address' : 'Change',
                style: const TextStyle(
                  color: Color(0xFFD9A66C),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFD9A66C).withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Color(0xFFD9A66C), size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: LightText(
                  text: deliveryAddress ?? 'No address added yet',
                  size: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Entering address details
  void _openAddressDialog() {
    final houseController = TextEditingController();
    final streetController = TextEditingController();
    final cityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF1A1512),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // dialog only as tall as its content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  text: 'Enter Delivery Address',
                  size: 18,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),

                _addressField(houseController, 'House / Building No.'),
                const SizedBox(height: 12),
                _addressField(streetController, 'Street'),
                const SizedBox(height: 12),
                _addressField(cityController, 'City'),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // combine the three fields string,
                      // skipping empty ones
                      final parts = [
                        houseController.text,
                        streetController.text,
                        cityController.text,
                      ].where((part) => part.trim().isNotEmpty);

                      setState(() {
                        deliveryAddress = parts.join(', ');
                      });

                      Navigator.pop(context); // closes the popup
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B5A2B),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: BoldText(
                      text: 'Confirm',
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // one text input field — used 3 times above
  Widget _addressField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
      ),
    );
  }

  // One selectable payment method
  Widget _paymentMethodTile(String label, IconData icon, int index) {
    final selected = selectedMethod == index;
    return GestureDetector(
      onTap: () => setState(() => selectedMethod = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFD9A66C).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selected ? const Color(0xFFD9A66C) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFD9A66C), size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: LightText(text: label, size: 14, color: Colors.white),
            ),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? const Color(0xFFD9A66C) : Colors.white38,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Order summary
  Widget _orderSummary(List<CartEntry> entries) {
    const double deliveryFee = 1.50;
    final subtotal = CartManager.instance.totalPrice;
    final total = subtotal + deliveryFee;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD9A66C).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ...entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LightText(
                      text: '${entry.item.name} x${entry.quantity}',
                      size: 13,
                      color: Colors.white70,
                    ),
                  ),
                  LightText(
                    text: '\$${entry.total.toStringAsFixed(2)}',
                    size: 13,
                    color: Colors.white70,
                  ),
                ],
              ),
            );
          }),
          const Divider(color: Colors.white24, height: 20),
          _summaryRow('Subtotal', subtotal),
          const SizedBox(height: 6),
          _summaryRow('Delivery Fee', deliveryFee),
          const Divider(color: Colors.white24, height: 20),
          _summaryRow('Total', total, bold: true),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, double amount, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        bold
            ? BoldText(text: label, size: 15, color: Colors.white)
            : LightText(text: label, size: 13, color: Colors.white70),
        bold
            ? BoldText(
                text: '\$${amount.toStringAsFixed(2)}',
                size: 15,
                color: const Color(0xFFD9A66C),
              )
            : LightText(
                text: '\$${amount.toStringAsFixed(2)}',
                size: 13,
                color: Colors.white70,
              ),
      ],
    );
  }

  // Place Order
  Widget _placeOrderBar(List<CartEntry> Entry) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(color: Color(0xFF12100D)),
      child: ElevatedButton(
        // requires an address
        onPressed: (Entry.isEmpty || deliveryAddress == null)
            ? null
            : () {
                // order-submission logic
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B5A2B),
          padding: const EdgeInsets.symmetric(vertical: 18),
          minimumSize: const Size(double.infinity, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: BoldText(text: 'Place Order', size: 16, color: Colors.white),
      ),
    );
  }
}
