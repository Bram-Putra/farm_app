import 'package:charts_flutter/flutter.dart' as charts;
import 'package:farmapp/podo/feeding_chart.dart';
import 'package:flutter/material.dart';

class FeedingChart extends StatefulWidget {
  final FeedingChartModel chartModel;
  final List<charts.Series> seriesList;
  final bool animate = false;

  FeedingChart(this.chartModel, this.seriesList);

  @override
  _FeedingChartState createState() => _FeedingChartState();
}

class _FeedingChartState extends State<FeedingChart> {

  var customTickFormatter;

  @override
  void initState() {
    customTickFormatter = charts.BasicNumericTickFormatterSpec((num value) {
      int index = value.toInt();
//      print('index '+index.toString());
//      print('data length '+widget.chartModel.data.length.toString());
      if(widget.chartModel.data!=null && widget.chartModel.data.length>0) {
//        if(index<widget.chartModel.data.length) {
        List<FeedingChartValue> list = widget.chartModel.data.values.toList()[0];
        if(index<list.length){
//          print('list length '+list.length.toString());
          return list[index].series;
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
    return Expanded(
      child: new charts.LineChart(widget.seriesList, animate: widget.animate,
        domainAxis: charts.NumericAxisSpec(tickFormatterSpec: customTickFormatter))
      );
  }
}

