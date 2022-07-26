import 'package:riskmanagement/classes/Metric.dart';

import 'Metric.dart';
import 'Risk.dart';

class CreateMetrics {
  static List<Metric>? create() {
    List<Metric> returnThis = <Metric>[];

    Metric tempMetric = Metric("The total number of defects");
    Risk tempRisk = Risk("The number of defects are well below where expected", 0);// tempRisk.numberOfVotes = 10;
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The number of defects are about where we expect", 1);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The number of defects are slightly above what is expected", 2);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The number of defects greatly exceed expectations", 3);
    tempMetric.addToList(tempRisk);
    returnThis.add(tempMetric);

    tempMetric = Metric("Schedule feasibility");
    tempRisk = Risk("The project can be easily completed in the scheduled time", 0);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The project can be completed in the scheduled time with strict time management", 1); //tempRisk.numberOfVotes = 10;
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The project may be completed in the scheduled time, but will require crunch", 2);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The project is unlikely to be completed in the scheduled time", 3);
    tempMetric.addToList(tempRisk);
    returnThis.add(tempMetric);

    tempMetric = Metric("Design progress");
    tempRisk = Risk("The design is complete", 0);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The design is mostly complete and no major problems are noted", 1);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The design is incomplete and one major problem is noted with strategies to mitigate", 2);// tempRisk.numberOfVotes = 10;
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The design is incomplete, has several major problems with no plans to mitigate", 3);
    tempMetric.addToList(tempRisk);
    returnThis.add(tempMetric);

    tempMetric = Metric("Implementation progress");
    tempRisk = Risk("The implementation is ahead of schedule", 0);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The implementation is on schedule", 1);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The implementation is slightly behind schedule", 2);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("The implementation is far behind schedule", 3); //tempRisk.numberOfVotes = 40;

    tempMetric.addToList(tempRisk);
    returnThis.add(tempMetric);

    tempMetric = Metric("Integration progress");
    tempRisk = Risk("No major integration problems have been detected", 0);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("Minor integration problems have been detected", 1);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("At least one major integration problem has been detected, with plans to remedy", 2);
    tempMetric.addToList(tempRisk);
    tempRisk = Risk("Multiple major integration problems have been detected, with no plans to rememdy", 3);
    tempMetric.addToList(tempRisk);
    returnThis.add(tempMetric);

  return returnThis;
  }
}
