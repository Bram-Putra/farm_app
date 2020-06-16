import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:farmapp/widget/dashboard_detail_widget.dart';
import 'package:farmapp/widget/materi_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardListItem extends StatelessWidget {
  final DailyCheck _dailyCheck;
  DateFormat df = DateFormat("dd MMM yyyy");

  DashboardListItem(this._dailyCheck);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardDetail(_dailyCheck),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: color_divider, width: 1.0, style: BorderStyle.solid),
          ),
        ),
        child: Hero(
          tag: 'dashboard_' + _dailyCheck.checkId.toString(),
          child: Material(
            color: color_primary_light,
            child: ListTile(
              title: Text(
                _dailyCheck.cage.tag + '\n' + df.format(_dailyCheck.checkDate),
              ),
              subtitle: Text('Nomor inspeksi: ' +
                  _dailyCheck.checkNumber +
                  '\n' +
                  'Populasi: ' +
                  _dailyCheck.alive.toInt().toString() +
                  '\n' +
                  'Mortalitas: ' +
                  _dailyCheck.dead.toInt().toString() +
                  '\n' +
                  'Panen: ' +
                  _dailyCheck.harvest.toInt().toString() +
                  '\n' +
                  'Berat rata-rata: ' +
                  _dailyCheck.averageWeight.toString() +
                  '\n' +
                  'Suhu ruangan: ' +
                  _dailyCheck.temperature.toString() +
                  '\n' +
                  'Kelembaban: ' +
                  _dailyCheck.humidity.toString()),
              onTap: null,
            ),
          ),
        ),
      ),
    );
  }
}
