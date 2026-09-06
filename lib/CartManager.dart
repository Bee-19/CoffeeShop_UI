import 'package:coffeeshop_ui/Item_List.dart';
import 'package:flutter/material.dart';

class CartEntry {
  final CoffeeItem item;
  final String? size;
  int quantity;

  CartEntry({required this.item, this.size, this.quantity = 1});
  double get total => item.price * quantity;
}

class CartManager {
  // private constructor
  // the underscore forbids from creating a spearate cart
  CartManager._();

  static final CartManager instance = CartManager._();

  final List<CartEntry> Entry = [];

  void add(CoffeeItem item, {String? size, int quantity = 1}) {
    //"where" filters the list down to matches; comparing by name since
    // CoffeeItem doesn't have a unique id field
    final match = Entry.where(
      (e) => e.item.name == item.name && e.size == size,
    );
    if (match.isNotEmpty) {
      match.first.quantity += quantity;
    } else {
      Entry.add(CartEntry(item: item, size: size, quantity: quantity));
    }
  }

  // "fold" walks through the list once, keeping a running sum (starts at 0)
  double get totalPrice => Entry.fold(0, (sum, e) => sum + e.total);
}
