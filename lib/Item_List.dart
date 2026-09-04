import 'package:flutter/material.dart';

class CoffeeItem {
  // used by all Pages
  final String name;
  final String description;
  final String imagePath;
  final double rating;
  final double price;
  final String dialogue;

  // used by CoffeeDetailPage
  final String longDescription;
  final String roast;
  final String tag1Label;
  final IconData tag1Icon;
  final String tag2Label;
  final IconData tag2Icon;

  const CoffeeItem({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.price,
    required this.dialogue,
    required this.longDescription,
    required this.roast,
    required this.tag1Label,
    required this.tag1Icon,
    required this.tag2Label,
    required this.tag2Icon,
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
    longDescription:
        'Cappuccino is a latte made with more foam than steamed milk, '
        'often finished with a sprinkle of cocoa powder or cinnamon on top.',
    roast: 'Medium Roasted',
    tag1Label: 'Coffee',
    tag1Icon: Icons.coffee,
    tag2Label: 'Oat Milk',
    tag2Icon: Icons.water_drop,
  ),
  CoffeeItem(
    name: 'Espresso',
    description: 'Double Shot',
    imagePath: 'assets/hot_ex.jpg',
    rating: 4.5,
    price: 4.50,
    dialogue: 'Bold, dark,\nextremely strong.',
    longDescription:
        'Espresso is a concentrated coffee shot brewed by forcing hot water '
        'through finely-ground beans, delivering a bold, intense flavor in every sip.',
    roast: 'Dark Roasted',
    tag1Label: 'Coffee',
    tag1Icon: Icons.coffee,
    tag2Label: 'No Milk',
    tag2Icon: Icons.block,
  ),
  CoffeeItem(
    name: 'Latte',
    description: 'With Vanilla Syrup',
    imagePath: 'assets/Latte_Van.jpg',
    rating: 4.3,
    price: 4.00,
    dialogue: 'Silky, smooth,\nsubtly sweet.',
    longDescription:
        'A latte blends a shot of espresso with steamed milk and a light layer of '
        'foam, sweetened here with a touch of vanilla syrup for a smooth, mellow cup.',
    roast: 'Medium Roasted',
    tag1Label: 'Coffee',
    tag1Icon: Icons.coffee,
    tag2Label: 'Vanilla',
    tag2Icon: Icons.local_drink,
  ),
  CoffeeItem(
    name: 'Americano',
    description: 'Extra Hot',
    imagePath: 'assets/Ameri.jpg',
    rating: 4.1,
    price: 3.50,
    dialogue: 'Clean, honest,\nsharp and hot.',
    longDescription:
        'Americano is espresso diluted with hot water, giving it a similar '
        'strength to drip coffee but with a distinct, layered flavor.',
    roast: 'Dark Roasted',
    tag1Label: 'Coffee',
    tag1Icon: Icons.coffee,
    tag2Label: 'Extra Hot',
    tag2Icon: Icons.whatshot,
  ),
  CoffeeItem(
    name: 'Mocha',
    description: 'With Whipped Cream',
    imagePath: 'assets/mocha.jpg',
    rating: 4.2,
    price: 5.00,
    dialogue: 'Decadent, dreamy,\nindulgent.',
    longDescription:
        'Mocha combines espresso, steamed milk, and rich chocolate syrup, '
        'topped with whipped cream for a dessert-like, indulgent treat.',
    roast: 'Medium Roasted',
    tag1Label: 'Chocolate',
    tag1Icon: Icons.icecream,
    tag2Label: 'Whipped',
    tag2Icon: Icons.cloud,
  ),
];
