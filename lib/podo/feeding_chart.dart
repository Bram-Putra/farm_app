import 'dart:collection';

class FeedingChartModel {
  Map<String, List<FeedingChartValue>> data = Map();

  FeedingChartModel() {}

  FeedingChartModel.fromJson(Map<String, dynamic> json){
    var jsonMap = json['map'];
    if(jsonMap!=null){
      jsonMap.forEach((k, v) => {
          print(k.toString()+'--'+v.toString()),
          data.putIfAbsent(k.toString(), () => convertToList(v))
      });
//      print(data.toString());
    }
  }

  List<FeedingChartValue> convertToList(var sourceData) {
    List<FeedingChartValue> tmp = [];
    for(int i=0; i<sourceData.length; i++){
      FeedingChartValue fc = FeedingChartValue();
      fc.axis = sourceData[i]['axis'];
      fc.value = sourceData[i]['nilai'];
      fc.series = sourceData[i]['series'];
      tmp.add(fc);
    }
    return tmp;
  }
}

class FeedingChartValue {
  int axis;
  String series;
  double value;

  FeedingChartValue() {}

  FeedingChartValue.fromJson(Map<String, dynamic> json){
    axis = json['axis'];
    series = json['series'];
    value = json['value'];
  }
}