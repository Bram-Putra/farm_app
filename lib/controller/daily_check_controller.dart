import 'dart:convert';

import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DailyCheckController {

  DailyCheckController() {}

  Future<List> selectDailyCheck() async{
    List<DailyCheck> list = [];
    var url = url_path+'v1/dailyChecks/all';
    var res = await http.get(url);
//    print(res.body);

    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
//      print(decodedJson);
      for (int i = 0; i < decodedJson.length; i++) {
        DailyCheck dc = DailyCheck.fromJson(decodedJson[i]);
        list.add(dc);
      }
    }
    return list;
  }

  Future<String> saveDailyCheck(BuildContext context, DailyCheck entity) async{
    print('save');
    var url = url_path+'v1/dailyChecks';
    var json = jsonEncode(entity.toJson());
    print(json);
    var res = await http.post(url,
        body: json,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
//    print(res.body);
    int code = res.statusCode;
    print(code);
    if (code == 200) {
      return "";
    } else {
      return res.body;
    }
  }

  void deleteDailyCheck(BuildContext context, int indexNumber) {
    print('delete daily check');
  }
}
