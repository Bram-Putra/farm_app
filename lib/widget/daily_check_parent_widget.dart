import 'package:farmapp/controller/dashboard_controller.dart';
import 'package:farmapp/podo/daily_check_chart.dart';
import 'package:farmapp/widget/daily_check_chart_widget.dart';
import 'package:flutter/material.dart';


class DailyCheckParentChart extends StatefulWidget {
  @override
  _DailyCheckParentChartState createState() => _DailyCheckParentChartState();
}

class _DailyCheckParentChartState extends State<DailyCheckParentChart> {
  DashboardController dc = DashboardController();
  DailyCheckChartModel chartData = DailyCheckChartModel();


  @override
  void initState() {
    super.initState();
    Future<DailyCheckChartModel> result = dc.selectDailyCheckChart();
    result.then((value) => {
      chartData.alives = value.alives,
      chartData.deads = value.deads,
      chartData.harvests = value.harvests,
      chartData.averageWeights = value.averageWeights,
      setState(() {})
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DailyCheckChart(chartData, dc.createData(chartData.alives, chartData.deads, chartData.harvests, chartData.averageWeights), animate: false)
      ),
    );
  }

}
