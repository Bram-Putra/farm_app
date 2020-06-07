import 'package:farmapp/controller/dashboard_controller.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:farmapp/widget/dashboard_detail_widget.dart';
import 'package:date_format/date_format.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController _dController = DashboardController();
  List<DailyCheck> _listDailyCheck;

  _loadData() async {
    _listDailyCheck = _dController.getList();

    var url = url_path + 'v1/reports/dashboard';
    var res = await http.get(url);
    List decodedJson = jsonDecode(res.body);
    print(decodedJson);

    int code = res.statusCode;
    if (code == 200) {
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
      backgroundColor: const Color(color_primary_light),
      body: Column(
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
              color: const Color(color_primary_light),
              border: Border(
                bottom: BorderSide(
                    color: const Color(color_divider),
                    width: 2.0,
                    style: BorderStyle.solid),
              ),
            ),
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
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
                  title: Text(_listDailyCheck[index].cage.tag +
                      '\n' +
                      formatDate(_listDailyCheck[index].checkDate, [
                        dd,
                        '-',
                        mm,
                        '-',
                        yyyy,
                        ' ',
                        hh,
                        ':',
                        nn,
                        ':',
                        ss,
                        ' ',
                        am
                      ])),
//              title: Row(
//                children: <Widget>[
//                  Container(child: Text(_listDailyCheck[index].cage.tag),),
//                  Container(child: Text(formatDate(_listDailyCheck[index].checkDate, [dd,'-',mm,'-',yyyy,' ',hh,':',nn,':',ss,' ',am])),)
//                ],
//              ),
                  subtitle: Text('Check Number: ' +
                      _listDailyCheck[index].checkNumber +
                      '\n' +
                      'Alive: ' +
                      _listDailyCheck[index].alive.toString() +
                      '\n' +
                      'Dead: ' +
                      _listDailyCheck[index].dead.toString() +
                      '\n' +
                      'Harvest: ' +
                      _listDailyCheck[index].harvest.toString() +
                      '\n' +
                      'Average Weight: ' +
                      _listDailyCheck[index].averageWeight.toString() +
                      '\n' +
                      'Temperature: ' +
                      _listDailyCheck[index].temperature.toString() +
                      '\n' +
                      'Humidity: ' +
                      _listDailyCheck[index].humidity.toString()),
                  onTap: () {
                    _callDashboardDetail(_listDailyCheck[index]);
                  },
                ),
              );
            },
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
