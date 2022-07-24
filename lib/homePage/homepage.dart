import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:riskmanagement/homePage/homeStatusBar.dart';
import 'package:riskmanagement/homePage/homeRiskLists.dart';
import 'package:riskmanagement/classes/Metric.dart';
import 'package:riskmanagement/classes/Risk.dart';
import 'package:riskmanagement/classes/createMetrics.dart';
import 'package:riskmanagement/styles/navigationBar.dart';

import '../classes/MetricsDB.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Metric>? _myMetrics = MetricsDB.metricDB;


  double calculateOverallRisk() {
    if (_myMetrics!.length == 0) {//Nothing in the List
      return 0;
    }
    double tempRiskWeight = 0;
    int numberOfNoVotes = 0; // Count the metrics with no votes

    _myMetrics!.forEach((currMetric) {
      currMetric.computeMetricRiskweight();
      if (currMetric.totalRiskWeight == -1) {
        numberOfNoVotes++;
      } else {
        tempRiskWeight += currMetric.totalRiskWeight;
      }
    });
    if (_myMetrics!.length == numberOfNoVotes) {//No votes yet
      return 0;
    }

    tempRiskWeight /= (_myMetrics!.length - numberOfNoVotes); //Do not count the ones with no votes
    setState(() {});
    return tempRiskWeight;
  }

  double? calculateRiskMultiplier(int _risklvl) {
    if (_risklvl == 0) {
      return 0;
    } else if (_risklvl == 1) {
      return 1 / 3;
    } else if (_risklvl == 2) {
      return 2 / 3;
    } else if (_risklvl == 3) {
      return 1;
    }
  }

  List<Metric> sortByRiskiness(List<Metric> sortThis) {
    setState(() {});
    return _myMetrics!
      ..sort(((a, b) => b.totalRiskWeight.compareTo(a.totalRiskWeight)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(243, 197, 200, 206),
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                StatusBar(calculateOverallRisk()),
                Flexible(
                  child: SingleChildScrollView(
                    child: RiskList(sortByRiskiness(_myMetrics!)),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}