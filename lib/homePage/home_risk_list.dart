import 'package:flutter/material.dart';
import '../styles/metric_container.dart';

import 'package:riskmanagement/classes/metric.dart';

class RiskList extends StatelessWidget {
  final List<Metric> _myMetricsList;

  RiskList(this._myMetricsList);

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
            ],
          ),
        ],
      ),
    );
  }
}
