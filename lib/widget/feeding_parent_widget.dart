import 'package:farmapp/controller/dashboard_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/feeding_chart.dart';
import 'package:farmapp/widget/feeding_chart_period_widget.dart';
import 'package:farmapp/widget/feeding_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class FeedingParentChart extends StatefulWidget {
  final String cageId;
  const FeedingParentChart(this.cageId);

  @override
  _FeedingParentChartState createState() => _FeedingParentChartState();
}

class _FeedingParentChartState extends State<FeedingParentChart> {
  DashboardController dc = DashboardController();
  FeedingChartModel chartData = FeedingChartModel();
  TextEditingController tcPeriod = TextEditingController();
  List<Widget> legends = [];


  @override
  void initState() {
    super.initState();
    tcPeriod.text='1';
    tcPeriod.addListener(_onPeriodChange);
    _onPeriodChange();
  }

  _onPeriodChange() {
    Future<FeedingChartModel> result = dc.selectFeedingChart(widget.cageId, tcPeriod.text);
    result.then((value) => {
      if(value!=null){
        legends.clear(),
        chartData.data = value.data,
        chartData.data.forEach((key, value) {
          legends.add(Text(key.toString()));
        }),
        setState(() {})
      },

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
            FeedingPeriodDropdown(tcPeriod: tcPeriod),
            FeedingChart(chartData, dc.createFeedingData(chartData.data)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: legends
            ),
            SizedBox(height: 8.0,)
          ],
        ),
      ),
    );
  }
}
