class DailyCheckChartModel {
  List<DailyCheckChartValue> alives = [];
  List<DailyCheckChartValue> deads = [];
  List<DailyCheckChartValue> harvests = [];
  List<DailyCheckChartValue> averageWeights = [];

  DailyCheckChartModel() {}

  DailyCheckChartModel.fromJson(Map<String, dynamic> json){
    var jsonAlive = json['alive'];
    var jsonDead = json['dead'];
    var jsonHarvest = json['harvest'];
    var jsonAverageWeight = json['averageWeight'];

    if(jsonAlive!=null){
      for(int i=0; i<jsonAlive.length; i++){
        DailyCheckChartValue alive = DailyCheckChartValue();
        alive.axis = jsonAlive[i]['axis'];
        alive.series = jsonAlive[i]['series'];
        alive.value = jsonAlive[i]['nilai'];
        alives.add(alive);
      }
    }

    if(jsonDead!=null){
      for(int i=0; i<jsonDead.length; i++){
        DailyCheckChartValue dead = DailyCheckChartValue();
        dead.axis = jsonDead[i]['axis'];
        dead.series = jsonDead[i]['series'];
        dead.value = jsonDead[i]['nilai'];
        deads.add(dead);
      }
    }

    if(jsonHarvest!=null){
      for(int i=0; i<jsonHarvest.length; i++){
        DailyCheckChartValue harvest = DailyCheckChartValue();
        harvest.axis = jsonHarvest[i]['axis'];
        harvest.series = jsonHarvest[i]['series'];
        harvest.value = jsonHarvest[i]['nilai'];
        harvests.add(harvest);
      }
    }

    if(jsonAverageWeight!=null){
      for(int i=0; i<jsonAverageWeight.length; i++){
        DailyCheckChartValue averageWeight = DailyCheckChartValue();
        averageWeight.axis = jsonAverageWeight[i]['axis'];
        averageWeight.series = jsonAverageWeight[i]['series'];
        averageWeight.value = jsonAverageWeight[i]['nilai'];
        averageWeights.add(averageWeight);
      }
    }
  }
}

class DailyCheckChartValue {
  int axis;
  String series;
  double value;
}