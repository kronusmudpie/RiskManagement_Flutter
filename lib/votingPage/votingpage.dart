// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../classes/Metric.dart';
import '../classes/MetricsDB.dart';
import '../styles/metricContainer.dart';
import '../styles/riskContainer.dart';
import './votingarea.dart';

class VotingPage extends StatefulWidget {
  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  List<Metric> _myMetrics = MetricsDB.metricDB!;
  int _activeIndex = 0;

  // AnimationController? _controller;
  // Animation<double>? _animation;

  // @override
  // initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //     duration: const Duration(seconds: 3),
  //     vsync: this,
  //   )..repeat(reverse: false);
  //   _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
  // }

  // @override
  // void dispose() {
  //   _controller!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
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
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: 500,
                ),
                margin: EdgeInsets.symmetric(vertical: 40),
                child: CarouselSlider.builder(
                  itemCount: _myMetrics.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState((() => _activeIndex = index));
                    },
                    initialPage: _activeIndex,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return buildTitle(
                      _myMetrics.elementAt(index).title.toString(),
                    );
                  },
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 700,
                ),
                child: Column(
                  children: [
                    ...(_myMetrics.elementAt(_activeIndex).riskListDesc)
                        .map((currMetric) {
                      return VotingArea(
                        currMetric,
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String myString) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 20, 122, 206),
            Color.fromARGB(255, 36, 150, 243),
            Color.fromARGB(255, 85, 178, 255),
            Color.fromARGB(255, 144, 204, 253),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          myString,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
