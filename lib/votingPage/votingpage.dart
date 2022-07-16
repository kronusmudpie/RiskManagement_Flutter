// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class VotingPage extends StatefulWidget {
  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
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
          child: Center(
            child: Text(
              "Voting Page",
              style: TextStyle(
                fontSize: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
