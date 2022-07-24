// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  final double _riskScore;

  StatusBar(@required this._riskScore) {
    statusColorChooser();
  }

  final double _MYRADIUS = 10.0;

  final List<List<Color>> _statusColorList = [
    [
      Color.fromARGB(255, 0, 158, 13),
      Color.fromARGB(255, 27, 163, 0),
      Color.fromARGB(255, 0, 255, 21),
    ],
    [
      Color.fromARGB(255, 204, 207, 0),
      Color.fromARGB(255, 221, 224, 17),
      Color.fromARGB(255, 251, 255, 31),
    ],
    [
      Color.fromARGB(255, 160, 0, 0),
      Color.fromARGB(255, 163, 0, 0),
      Color.fromARGB(255, 255, 0, 0),
    ],
  ];

  late final List<Color>? _myColor;
  late final String _statusMsg;

  void statusColorChooser() {
    if (_riskScore < (1 / 3)) {
      _myColor = _statusColorList[0];
      _statusMsg = "GREAT";
    } else if (_riskScore >= (1 / 3) && _riskScore <= (2 / 3)) {
      _myColor = _statusColorList[1];
      _statusMsg = "OKAY";
    } else if (_riskScore >= (2 / 3)) {
      _myColor = _statusColorList[2];
      _statusMsg = "HIGH RISK";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      ),
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            "Overall Status",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(_MYRADIUS),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _myColor!,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    primary: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(_statusMsg),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
