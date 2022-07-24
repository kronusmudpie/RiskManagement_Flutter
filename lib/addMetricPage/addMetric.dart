import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddMetric extends StatefulWidget {
  @override
  State<AddMetric> createState() => _AddMetricState();
}

class _AddMetricState extends State<AddMetric> {
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
            children: <Widget>[
              Text("TEST"),
            ],
          ),
        ),
      ),
    );
  }
}
