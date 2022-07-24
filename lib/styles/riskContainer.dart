import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'package:riskmanagement/classes/Risk.dart';

class RiskContainer extends StatelessWidget {
  final Risk _myRisk;
  RiskContainer(@required this._myRisk);

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
            child: Container(
              //padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                _myRisk.riskDesc.toString(),
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            width: 40,
            padding: EdgeInsets.all(10),
            //margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 226, 226),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                _myRisk.numberOfVotes.toString(),
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
