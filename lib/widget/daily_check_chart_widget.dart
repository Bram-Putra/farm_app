import 'package:charts_flutter/flutter.dart' as charts;
import 'package:farmapp/podo/daily_check_chart.dart';
import 'package:flutter/material.dart';

/// Example of a line chart rendered with dash patterns.
class DailyCheckChart extends StatefulWidget {
  final DailyCheckChartModel data;
  final List<charts.Series> seriesList;
  final bool animate;

  DailyCheckChart(this.data, this.seriesList, {this.animate});

  @override
  _DailyCheckChartState createState() => _DailyCheckChartState();
}

class _DailyCheckChartState extends State<DailyCheckChart> {

  var customTickFormatter;

  @override
  void initState() {
    customTickFormatter = charts.BasicNumericTickFormatterSpec((num value) {
      int index = value.toInt();
      if(widget.data.alives!=null && widget.data.alives.length>0) {
        if(index<widget.data.alives.length) {
          return widget.data.alives[value.toInt()].series;
        } else {
          return '';
        }
      } else {
        return 'abc';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return new charts.LineChart(widget.seriesList, animate: widget.animate,
        domainAxis: charts.NumericAxisSpec(tickFormatterSpec: customTickFormatter),
    );
  }
}

