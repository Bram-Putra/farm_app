import 'package:farmapp/controller/main_controller.dart';
import 'package:farmapp/controller/cage_detail_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/podo/livestock_type.dart';
import 'package:farmapp/widget/group_category_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'livestock_type_dropdown_widget.dart';

class DashboardDetail extends StatefulWidget {
  final DailyCheck dailyCheck;
  const DashboardDetail(this.dailyCheck);
  @override
  _DashboardDetailState createState() => _DashboardDetailState();
}

class _DashboardDetailState extends State<DashboardDetail> {
  MainController mainController = MainController();
  CageDetailController _cageDetailController = CageDetailController();

  final tcCheckId = TextEditingController();
  final tcCheckNumber = TextEditingController();
  final tcCheckDate = TextEditingController();
  final tcAlive = TextEditingController();
  final tcDead = TextEditingController();
  final tcHarvest = TextEditingController();
  final tcAverageWeight = TextEditingController();
  final tcTemperature = TextEditingController();
  final tcHumidity = TextEditingController();
  final tcCage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.dailyCheck != null) {
      tcCheckId.text = widget.dailyCheck.checkId.toString();
      tcCheckNumber.text = widget.dailyCheck.checkNumber;
      tcCheckDate.text = widget.dailyCheck.checkDate.toString();
      tcAlive.text = widget.dailyCheck.alive.toString();
      tcDead.text = widget.dailyCheck.dead.toString();
      tcHarvest.text = widget.dailyCheck.harvest.toString();
      tcAverageWeight.text = widget.dailyCheck.averageWeight.toString();
      tcTemperature.text = widget.dailyCheck.temperature.toString();
      tcHumidity.text = widget.dailyCheck.humidity.toString();
      tcCage.text = widget.dailyCheck.cage.cageId.toString();
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF455A64),
          title: Text('Dashboard'),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.playlist_add_check)),
            Tab(icon: Icon(Icons.network_check)),
            Tab(icon: Icon(Icons.compare))
          ]),
        ),
        body: TabBarView(
          children: [
            ListTile(
              leading: Icon(Icons.playlist_add_check),
              title: Text('Summary'),
            ),
            ListTile(
              leading: Icon(Icons.network_check),
              title: Text('Graph'),
            ),
            ListTile(
              leading: Icon(Icons.compare),
              title: Text('Compare'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tcCheckId.dispose();
    tcCheckNumber.dispose();
    tcCheckDate.dispose();
    tcAlive.dispose();
    tcDead.dispose();
    tcHarvest.dispose();
    tcAverageWeight.dispose();
    tcTemperature.dispose();
    tcHumidity.dispose();
    tcCage.dispose();

    super.dispose();
  }
}