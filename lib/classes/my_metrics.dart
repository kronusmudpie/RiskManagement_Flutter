import 'package:riskmanagement/classes/create_metrics.dart';

import 'metric.dart';
import 'create_metrics.dart';

class MyMetrics {
  List<Metric>? _myMetric;

  MyMetrics(){
    _myMetric = CreateMetrics.create();
  }

  List<Metric>? returnMyMetrics(){
    return this._myMetric;
  }

  void updateMetrics(List<Metric> updatedMetrics){
    this._myMetric = updatedMetrics;
  }
}