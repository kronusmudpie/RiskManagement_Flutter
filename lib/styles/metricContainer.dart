// ignore_for_file: prefer_const_constructors, invalid_required_positional_param

import 'package:flutter/material.dart';

import 'package:riskmanagement/homePage/metricInfoBuilder.dart';
import 'package:riskmanagement/classes/Metric.dart';

class MetricContainer extends StatelessWidget {
  final double _MYRADIUS = 10.0;
  final Metric _myMetric; 
  MetricContainer(@required this._myMetric){
    _myColor = MaterialStateProperty.all(riskColorChooser());
  }

  late MaterialStateProperty<Color> _myColor;
  Color riskColorChooser() {
    Color? metricColor;
    int colorModifier = 50 * _myMetric.totalRiskWeight.toInt();
    if (_myMetric.totalRiskWeight == -1){ // No votes
      metricColor = Colors.grey;
    } else if (_myMetric.totalRiskWeight < (1 / 3)) {
      metricColor = Color.fromARGB(255, 15, (170 - colorModifier), 20); // The more risk, the less green
    } else if (_myMetric.totalRiskWeight >= (1 / 3) && _myMetric.totalRiskWeight <= (2/3)) { 
      metricColor = Color.fromARGB(255, (223 - colorModifier), (200 - colorModifier), 0);        // The more risk, the more yellow the color
    } else if (_myMetric.totalRiskWeight >= (2/3)) {
      metricColor = Color.fromARGB(255, 255, (63 - colorModifier), (50 - colorModifier)); //The riskier, the redder the color
    }
    return metricColor!;
  }

  void showInfo(BuildContext context){
    MetricInfoBuilder(this, _myMetric).showInfo(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      width:170,
      height: 150,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: _myColor,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_MYRADIUS),
          )),
        ),
        child: Text(
          _myMetric.title.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        onPressed: () => showInfo(context),
      ),
    );
  }
}
