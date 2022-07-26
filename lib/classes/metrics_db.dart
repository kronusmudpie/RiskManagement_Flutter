import 'package:riskmanagement/classes/Risk.dart';

import 'metric.dart';
import 'my_metrics.dart';

class MetricsDB{
  static List<Metric>? metricDB = MyMetrics().returnMyMetrics();

  static void addToMetric(String metricTitle, String minRisk, String lowRisk,
  String reasonableRisk, String highRisk ){
    Metric tempMetric = Metric(metricTitle);  //Create temp Metric to add
    Risk tempRisk = Risk(minRisk, 0);
    tempMetric.riskListDesc.add(tempRisk);  //Add Minimal risk
    tempRisk = Risk(lowRisk, 1);
    tempMetric.riskListDesc.add(tempRisk);  //Add Low Risk
    tempRisk = Risk(reasonableRisk, 2);
    tempMetric.riskListDesc.add(tempRisk);  //Add Reasonable Risk
    tempRisk = Risk(highRisk, 3);
    tempMetric.riskListDesc.add(tempRisk);  //Add high risk
  
    metricDB!.add(tempMetric);
  }
}