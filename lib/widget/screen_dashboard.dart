import 'package:farmapp/controller/dashboard_controller.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/widget/dashboard_list_item.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:farmapp/widget/dashboard_detail_widget.dart';
import 'package:intl/intl.dart';

class ScreenDashboard extends StatefulWidget {
  @override
  _ScreenDashboardState createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  DashboardController _dController = DashboardController();
  List<DailyCheck> _listDailyCheck;
  DateFormat df = DateFormat("dd MMM yyyy");

  _loadData() async {
    _listDailyCheck = _dController.getList();

    var url = url_path + 'v1/reports/dashboard';
    var res = await http.get(url);
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
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Hero(
            tag: 'icon_dashboard',
            child: Icon(
              icon_dashboard,
              color: Colors.white,
            ),
          ),
          title: Hero(
            tag: 'text_dashboard',
            child: Text(
              'Dashboard',
              style: appbar_textstyle,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Kembali ke halaman utama',
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      backgroundColor: color_primary_light,
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'body_dashboard',
            child: Container(
              color: color_primary_light,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text('Daily Check'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: color_primary_light,
                  border: Border(
                    bottom: BorderSide(
                        color: color_divider,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: _listDailyCheck.map((dailyCheck) => DashboardListItem(dailyCheck)).toList(),
              ),
//              ListView.builder(
//                shrinkWrap: true,
//                itemCount: _listDailyCheck.length,
//                itemBuilder: (context, index) {
//                  return Container(
//                    decoration: BoxDecoration(
//                      color: color_primary_light,
//                      border: Border(
//                        bottom: BorderSide(
//                            color: color_divider,
//                            width: 1.0,
//                            style: BorderStyle.solid),
//                      ),
//                    ),
//                    child: ListTile(
//                      title: Text(_listDailyCheck[index].cage.tag +
//                          '\n' +
//                          df.format(_listDailyCheck[index].checkDate)),
//                      subtitle: Text('Nomor inspeksi: ' +
//                          _listDailyCheck[index].checkNumber +
//                          '\n' +
//                          'Populasi: ' +
//                          _listDailyCheck[index].alive.toInt().toString() +
//                          '\n' +
//                          'Mortalitas: ' +
//                          _listDailyCheck[index].dead.toInt().toString() +
//                          '\n' +
//                          'Panen: ' +
//                          _listDailyCheck[index].harvest.toInt().toString() +
//                          '\n' +
//                          'Berat rata-rata: ' +
//                          _listDailyCheck[index].averageWeight.toString() +
//                          '\n' +
//                          'Suhu ruangan: ' +
//                          _listDailyCheck[index].temperature.toString() +
//                          '\n' +
//                          'Kelembaban: ' +
//                          _listDailyCheck[index].humidity.toString()),
//                      onTap: () {
//                        _callDashboardDetail(_listDailyCheck[index]);
//                      },
//                    ),
//                  );
//                },
//              ),
            ],
          ),
        ],
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
