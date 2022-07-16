
class Risk{
  String? riskDesc;
  int numberOfVotes = 0;
  int riskLevel; //0 - 4
                  //0 : Minimal risk
                  //1 : Low Risk
                  //2 : Reasonable Risk
                  //3 : High Risk

  Risk(this.riskDesc, this.riskLevel);

  void incrementVote(){
    numberOfVotes++;
  }
}