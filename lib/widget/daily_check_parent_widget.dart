import 'package:farmapp/controller/dashboard_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/daily_check_chart.dart';
import 'package:farmapp/widget/daily_check_chart_period_widget.dart';
import 'package:farmapp/widget/daily_check_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class DailyCheckParentChart extends StatefulWidget {
  final String cageId;
  const DailyCheckParentChart(this.cageId);

  @override
  _DailyCheckParentChartState createState() => _DailyCheckParentChartState();
}

class _DailyCheckParentChartState extends State<DailyCheckParentChart> {
  DashboardController dc = DashboardController();
  DailyCheckChartModel chartData = DailyCheckChartModel();
  TextEditingController tcPeriod = TextEditingController();


  @override
  void initState() {
    super.initState();
    tcPeriod.text='1';
    tcPeriod.addListener(_onPeriodChange);
    _onPeriodChange();
//    Future<DailyCheckChartModel> result = dc.selectDailyCheckChart(widget.cageId, tcPeriod.text);
//    result.then((value) => {
//      chartData.alives = value.alives,
//      chartData.deads = value.deads,
//      chartData.harvests = value.harvests,
//      chartData.averageWeights = value.averageWeights,
//      setState(() {
//      })
//    });
  }

  _onPeriodChange() {
    Future<DailyCheckChartModel> result = dc.selectDailyCheckChart(widget.cageId, tcPeriod.text);
    result.then((value) => {
      if(value!=null){
        chartData.alives = value.alives,
        chartData.deads = value.deads,
        chartData.harvests = value.harvests,
        chartData.averageWeights = value.averageWeights
      } else {
        chartData.alives = [],
        chartData.deads = [],
        chartData.harvests = [],
        chartData.averageWeights = []
      },
      setState(() {})
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color_primary_light,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DailyCheckPeriodDropdown(tcPeriod: tcPeriod),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DailyCheckChart(chartData, dc.createDailyCheckData(chartData.alives, chartData.deads, chartData.harvests, chartData.averageWeights)),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Populasi', style: TextStyle(color: Colors.green)),
                Text('Mortalitas', style: TextStyle(color: Colors.red)),
                Text('Panen', style: TextStyle(color: Colors.blue)),
                Text('Berat rata-rata', style: TextStyle(color: Colors.black))
              ]
            ),
            SizedBox(height: 8.0,),
          ],
        ),
      ),
    );
  }

}
