import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: const Color.fromARGB(243, 197, 200, 206),
      animationDuration: const Duration(milliseconds: 400),
      onTap: (index){
      },
      items: const [
        Icon(Icons.home),
        Icon(Icons.favorite),
        Icon(Icons.settings),
      ],
    );
  }
}
