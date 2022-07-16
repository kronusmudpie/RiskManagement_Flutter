import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class bottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Color.fromARGB(243, 197, 200, 206),
      animationDuration: Duration(milliseconds: 400),
      onTap: (index){
      },
      items: [
        Icon(Icons.home),
        Icon(Icons.favorite),
        Icon(Icons.settings),
      ],
    );
  }
}
