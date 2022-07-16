// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:riskmanagement/classes/Metric.dart';

import 'homePage/homepage.dart';
import 'votingPage/votingpage.dart';
import './classes/myMetrics.dart';

//TEST TEST TEST

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}

class MyAppState extends State<MyApp> {
  List<Metric>? _myMetrics = MyMetrics().returnMyMetrics();

  int? _pageIndex = 0;
  final screens = [
    HomePage(),
    VotingPage(),
    Center(child: Text("Nothing yet", style: TextStyle(fontSize: 60))),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(243, 197, 201, 207),
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          items: [
            Icon(Icons.home),
            Icon(Icons.favorite),
            Icon(Icons.settings),
          ],
        ),
        body: screens[_pageIndex!],
      ),
    );
  }
}
