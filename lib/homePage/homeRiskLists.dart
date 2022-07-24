import 'package:flutter/material.dart';
import '/styles/metricContainer.dart';

import 'package:riskmanagement/classes/Metric.dart';

class RiskList extends StatelessWidget {
  List<Metric> _myMetricsList;

  RiskList(@required this._myMetricsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Wrap(
            children: [
              ...(_myMetricsList).map((currMetric) {
                return MetricContainer(currMetric);
              }).toList(),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                width: 170,
                height: 150,
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
