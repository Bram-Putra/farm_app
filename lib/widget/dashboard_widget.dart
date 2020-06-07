import 'package:farmapp/controller/dashboard_controller.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:farmapp/widget/dashboard_detail_widget.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController _dController = DashboardController();
  List<DailyCheck> _listDailyCheck;
  DateFormat df = DateFormat("dd MMM yyyy");

  _loadData() async {
    _listDailyCheck = _dController.getList();

    var url = url_path + 'v1/reports/dashboard';
    var res = await http.get(url);

//    print(decodedJson);

    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
      _listDailyCheck.clear();
      for (int i = 0; i < decodedJson.length; i++) {
        DailyCheck dc = DailyCheck.fromJson(decodedJson[i]);
        _listDailyCheck.add(dc);
      }
      setState(() {});
    } else {
      print("Something went wrong");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _listDailyCheck.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(color_primary_light),
              border: Border(
                bottom: BorderSide(
                    color: const Color(color_divider),
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
            ),
            child: ListTile(
              title: Text('Kandang: ' + _listDailyCheck[index].cage.tag),
              subtitle: Text('Nomor inspeksi: ' +
                  _listDailyCheck[index].checkNumber +
                  '\n' +
                  'Tanggal inspeksi: ' +
                  df.format(_listDailyCheck[index].checkDate) +
                  '\n' +
                  'Populasi: ' +
                  _listDailyCheck[index].alive.toInt().toString() +
                  '\n' +
                  'Mortalitas: ' +
                  _listDailyCheck[index].dead.toInt().toString() +
                  '\n' +
                  'Panen: ' +
                  _listDailyCheck[index].harvest.toInt().toString() +
                  '\n' +
                  'Berat rata-rata: ' +
                  _listDailyCheck[index].averageWeight.toString() +
                  '\n' +
                  'Suhu ruangan: ' +
                  _listDailyCheck[index].temperature.toString() +
                  '\n' +
                  'Kelembaban: ' + _listDailyCheck[index].humidity.toString()),
              onTap: () {
                _callDashboardDetail(_listDailyCheck[index]);
              },
            ),
          );
        },
      ),
    );
  }

  _callDashboardDetail(DailyCheck dc) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashboardDetail(dc)));
    setState(() {
      _loadData();
    });
  }
}
