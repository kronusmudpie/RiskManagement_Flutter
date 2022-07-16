import './Risk.dart';

class Metric {
  String? title;
  List<Risk> riskListDesc = <Risk>[];
  double totalRiskWeight = 0;
  int totalVotes = 0;

  Metric(this.title);

  void addToList(Risk addThisRisk) {
    this.riskListDesc.add(addThisRisk);
  }

  String showRiskDesc(int index) {
    return riskListDesc.elementAt(index).riskDesc.toString();
  }

  int showVotes(int index) {
    return riskListDesc.elementAt(index).numberOfVotes.toInt();
  }

  void _calculateTotalVotes() {
    riskListDesc.forEach((currRisk) {
      this.totalVotes += currRisk.numberOfVotes;
    });
  }

  void computeMetricRiskweight() { // Sets value of this.totalRiskValue 0 -> 1
    _calculateTotalVotes();
    if (totalVotes == 0) { //No votes yet
      this.totalRiskWeight = -1;
    } else {
      double multiplier = 0;
      double tempRiskValue = 0;
      riskListDesc.forEach((currRisk) {
        if (currRisk.riskLevel == 1) {
          multiplier = 1 / 3;
        } else if (currRisk.riskLevel == 2) {
          multiplier = 2 / 3;
        } else if (currRisk.riskLevel == 3) {
          multiplier = 1;
        }
        tempRiskValue += multiplier * currRisk.numberOfVotes;
      });
      
      this.totalRiskWeight = tempRiskValue / this.totalVotes;
    }
  }
}
