import './Metric.dart';
import './myMetrics.dart';

class MetricsDB{
  static List<Metric>? metricDB = MyMetrics().returnMyMetrics();
}