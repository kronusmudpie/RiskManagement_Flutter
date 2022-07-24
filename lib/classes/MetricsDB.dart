import './Metric.dart';
import './myMetrics.dart';

class MetricsDB{
  List<Metric>? metricDB = MyMetrics().returnMyMetrics();
}