import 'package:flutter/material.dart';

class CoffeeItem {
  final String name;
  final String description;
  final String imagePath;
  final double rating;
  final double price;
  final String dialogue;

  const CoffeeItem({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.price,
    required this.dialogue,
  });
}

List<CoffeeItem> coffeeItems = [
  CoffeeItem(
    name: 'Cappuccino',
    description: 'With Oat Milk',
    imagePath: 'assets/Cap_Oat.jpg',
    rating: 4.5,
    price: 4.50,
    dialogue: 'Velvety, warm,\nquietly comforting.',
  ),
  CoffeeItem(
    name: 'Espresso',
    description: 'Double Shot',
    imagePath: 'assets/hot_ex.jpg',
    rating: 4.5,
    price: 4.50,
    dialogue: 'Bold, dark,\nextremely strong.',
  ),
  CoffeeItem(
    name: 'Latte',
    description: 'With Vanilla Syrup',
    imagePath: 'assets/Latte_Van.jpg',
    rating: 4.3,
    price: 4.00,
    dialogue: 'Silky, smooth,\nsubtly sweet.',
  ),
  CoffeeItem(
    name: 'Americano',
    description: 'Extra Hot',
    imagePath: 'assets/Ameri.jpg',
    rating: 4.1,
    price: 3.50,
    dialogue: 'Clean, honest,\nsharp and hot.',
  ),
  CoffeeItem(
    name: 'Mocha',
    description: 'With Whipped Cream',
    imagePath: 'assets/mocha.jpg',
    rating: 4.2,
    price: 5.00,
    dialogue: 'Decadent, dreamy,\nindulgent.',
  ),
];
