// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:riskmanagement/classes/Risk.dart';

class VotingArea extends StatefulWidget {
  final Risk _myRisk;

  VotingArea(this._myRisk);

  @override
  State<VotingArea> createState() => _VotingAreaState();
}

class _VotingAreaState extends State<VotingArea> {
  Color _buttonColor = Color.fromARGB(255, 104, 104, 104);

  void addVote() async {
    widget._myRisk.incrementVote();

    setState(() {_buttonColor = Colors.blue;});
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {_buttonColor = Color.fromARGB(255, 104, 104, 104);});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: [
            Color.fromARGB(243, 170, 175, 184),
            Color.fromARGB(255, 238, 238, 238),
            Color.fromARGB(255, 238, 238, 238),
            Color.fromARGB(255, 218, 216, 216),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget._myRisk.riskDesc.toString(),
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              primary: _buttonColor,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: addVote,
            child: Icon(Icons.plus_one),
          ),
        ],
      ),
    );
  }
}
