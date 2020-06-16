import 'package:farmapp/podo/daily_check.dart';
import 'dart:convert';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/daily_check_chart.dart';
import 'package:farmapp/podo/feeding_chart.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardController {
  List<DailyCheck> _listDailyCheck = [];
  DashboardController() {}

  Future<DailyCheckChartModel> selectDailyCheckChart(String cageId, String period) async {
    DailyCheckChartModel dc;
    var url = url_path + 'v1/reports/dailyChart?cageId='+cageId+'&range='+period;
    var res = await http.get(url);
//    print(res.body);

    int code = res.statusCode;
    if (code == 200) {
      var decodedJson = jsonDecode(res.body);
//      print(decodedJson);
      dc = DailyCheckChartModel.fromJson(decodedJson);
    }
    return dc;
  }

  List<charts.Series<DailyCheckChartValue, int>> createDailyCheckData(List<DailyCheckChartValue> alives, List<DailyCheckChartValue> deads, List<DailyCheckChartValue> harvests, List<DailyCheckChartValue> averageWeights,) {
    return [
      new charts.Series<DailyCheckChartValue, int>(
        id: 'Alive',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (DailyCheckChartValue chartValue, _) => chartValue.axis,
        measureFn: (DailyCheckChartValue chartValue, _) => chartValue.value,
        displayName: 'Alive',
        data: alives,
      ),
      new charts.Series<DailyCheckChartValue, int>(
        id: 'Dead',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//        dashPattern: [2, 2],
        domainFn: (DailyCheckChartValue chartValue, _) => chartValue.axis,
        measureFn: (DailyCheckChartValue chartValue, _) => chartValue.value,
        displayName: 'Dead',
        data: deads,
      ),
      new charts.Series<DailyCheckChartValue, int>(
        id: 'Harvest',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//        dashPattern: [8, 3, 2, 3],
        domainFn: (DailyCheckChartValue chartValue, _) => chartValue.axis,
        measureFn: (DailyCheckChartValue chartValue, _) => chartValue.value,
        displayName: 'Harvest',
        data: harvests,
      ),
      new charts.Series<DailyCheckChartValue, int>(
        id: 'AverageWeight',
        colorFn: (_, __) => charts.MaterialPalette.black,
//        dashPattern: [8, 3, 2, 3],
        domainFn: (DailyCheckChartValue chartValue, _) => chartValue.axis,
        measureFn: (DailyCheckChartValue chartValue, _) => chartValue.value,
        displayName: 'Average Weight',
        data: averageWeights,
      )
    ];
  }

  Future<FeedingChartModel> selectFeedingChart(String cageId, String period) async {
    FeedingChartModel fc;
    var url = url_path + 'v1/reports/feeding?cageId='+cageId+'&range='+period;
    var res = await http.get(url);
    print(res.body);

    int code = res.statusCode;
    if (code == 200) {
      var decodedJson = jsonDecode(res.body);
      print(decodedJson);
      fc = FeedingChartModel.fromJson(decodedJson);
//      fc = decodedJson;
    }
    return fc;
  }

  List<charts.Series<FeedingChartValue, int>> createFeedingData(Map<String, List<FeedingChartValue>> data) {
    List<charts.Series<FeedingChartValue, int>> _result = [];
    data.forEach((key, value) {
      var chartData = new charts.Series<FeedingChartValue, int>(
        id: key,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (FeedingChartValue chartValue, _) => chartValue.axis,
        measureFn: (FeedingChartValue chartValue, _) => chartValue.value,
        data: value,
      );
      _result.add(chartData);
    });
    return _result;
  }
  
  List<DailyCheck> getList() {
    return _listDailyCheck;
  }

  DailyCheck getDailyCheck(int indexX) {
    return _listDailyCheck[indexX];
  }

  int getListSize() {
    return _listDailyCheck.length;
  }
}
