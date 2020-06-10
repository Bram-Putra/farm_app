import 'package:farmapp/controller/main_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:farmapp/widget/daily_check_parent_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardDetail extends StatefulWidget {
  final DailyCheck dailyCheck;
  const DashboardDetail(this.dailyCheck);
  @override
  _DashboardDetailState createState() => _DashboardDetailState();
}

class _DashboardDetailState extends State<DashboardDetail> {
  MainController mainController = MainController();
  DateFormat df = DateFormat("dd MMM yyyy");

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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color_primary_dark,
          title: ListTile(
            leading: Icon(
              icon_dashboard,
              color: Colors.white,
            ),
            title: Text(
              'Dashboard',
              style: appbar_textstyle,
            ),
          ),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.playlist_add_check)),
            Tab(icon: Icon(Icons.network_check))
          ]),
        ),
        body: TabBarView(
          children: [
            ListTile(
              title: Text('Summary ' + widget.dailyCheck.cage.tag),
              subtitle: Text('#Nomor inspeksi: ' + widget.dailyCheck.checkNumber + '\n' +
                  'Tanggal inspeksi: ' + df.format(widget.dailyCheck.checkDate) +'\n' +
                  'Populasi: ' + widget.dailyCheck.alive.toInt().toString() +'\n' +
                  'Mortalitas: ' + widget.dailyCheck.dead.toInt().toString() +'\n' +
                  'Panen: ' + widget.dailyCheck.harvest.toInt().toString() + '\n' +
                  'Berat rata-rata: ' +widget.dailyCheck.averageWeight.toString() + '\n' +
                  'Suhu ruangan: ' + widget.dailyCheck.temperature.toString() +'\n' +
                  'Kelembaban: ' + widget.dailyCheck.humidity.toString()),
            ),
            DailyCheckParentChart(tcCage.text)
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
