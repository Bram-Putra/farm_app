import 'package:farmapp/controller/dashboard_controller.dart';
import 'package:farmapp/podo/daily_check_chart.dart';
import 'package:farmapp/widget/daily_check_chart_widget.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController dc = DashboardController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListTile(
          leading: Icon(Icons.multiline_chart),
          title: Text('Dashboard'),
        ),
      ),
    );
  }


}
