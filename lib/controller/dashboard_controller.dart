import 'dart:convert';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/daily_check_chart.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardController {

  DashboardController() {}

  Future<DailyCheckChartModel> selectDailyCheckChart() async {
    DailyCheckChartModel dc;
    var url = url_path + 'v1/reports/dailyChart?cageId=2&range=3';
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

  List<charts.Series<DailyCheckChartValue, int>> createData(List<DailyCheckChartValue> alives, List<DailyCheckChartValue> deads, List<DailyCheckChartValue> harvests, List<DailyCheckChartValue> averageWeights,) {
    return [
      new charts.Series<DailyCheckChartValue, int>(
        id: 'Alive',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
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
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//        dashPattern: [8, 3, 2, 3],
        domainFn: (DailyCheckChartValue chartValue, _) => chartValue.axis,
        measureFn: (DailyCheckChartValue chartValue, _) => chartValue.value,
        displayName: 'Harvest',
        data: harvests,
      ),
      new charts.Series<DailyCheckChartValue, int>(
        id: 'AverageWeight',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//        dashPattern: [8, 3, 2, 3],
        domainFn: (DailyCheckChartValue chartValue, _) => chartValue.axis,
        measureFn: (DailyCheckChartValue chartValue, _) => chartValue.value,
        displayName: 'Average Weight',
        data: averageWeights,
      )
    ];
  }
}
