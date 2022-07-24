import 'package:riskmanagement/classes/Risk.dart';

import './Metric.dart';
import './myMetrics.dart';

class MetricsDB{
  static List<Metric>? metricDB = MyMetrics().returnMyMetrics();

  static void addToMetric(String metricTitle, String minRisk, String lowRisk,
  String reasonableRisk, String highRisk ){
    Metric tempMetric = new Metric(metricTitle);  //Create temp Metric to add
    Risk tempRisk = new Risk(minRisk, 0);
    tempMetric.riskListDesc.add(tempRisk);  //Add Minimal risk
    tempRisk = new Risk(lowRisk, 1);
    tempMetric.riskListDesc.add(tempRisk);  //Add Low Risk
    tempRisk = new Risk(reasonableRisk, 2);
    tempMetric.riskListDesc.add(tempRisk);  //Add Reasonable Risk
    tempRisk = new Risk(highRisk, 3);
    tempMetric.riskListDesc.add(tempRisk);  //Add high risk
  
    metricDB!.add(tempMetric);
  }
}