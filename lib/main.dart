// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:riskmanagement/addMetricPage/addMetric.dart';
import 'package:riskmanagement/classes/Metric.dart';
import 'package:riskmanagement/classes/MetricsDB.dart';

import 'homePage/homepage.dart';
import 'votingPage/votingpage.dart';
import './classes/myMetrics.dart';

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
  int? _pageIndex = 0;
  final screens = [
    HomePage(),
    AddMetric(),
    VotingPage(),
  ];

  changeScreen() {
    return screens[_pageIndex!];
  }

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
          height: 60,
          items: [
            Icon(Icons.home),
            Icon(
              Icons.add,
              color: Colors.blue,
            ),
            Icon(Icons.article),
          ],
        ),
        body: changeScreen(),
      ),
    );
  }
}
