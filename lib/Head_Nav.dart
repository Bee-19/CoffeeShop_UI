import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Icon(Icons.person, size: 28, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final int currentIndex; // current page in index
  final ValueChanged<int> onTap;
  const NavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF12100D), // one shade darker than 0xFF1A1512
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex, // the current Page
        onTap: onTap, // the page that is tapped
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
    );
  }
}
