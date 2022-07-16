import 'package:riskmanagement/classes/createMetrics.dart';

import './Metric.dart';
import './createMetrics.dart';

class MyMetrics {
  List<Metric>? _myMetric;

  MyMetrics(){
    _myMetric = createMetrics.create();
  }

  List<Metric>? returnMyMetrics(){
    return this._myMetric;
  }

  void updateMetrics(List<Metric> updatedMetrics){
    this._myMetric = updatedMetrics;
  }
}