import 'dart:convert';

import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:farmapp/podo/feeding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedingController {

  FeedingController() {}

  Future<List> selectFeedingList() async{
    List<Feeding> list = [];
    var url = url_path+'v1/feedings/all';
    var res = await http.get(url);
//    print(res.body);

    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
//      print(decodedJson);
      for (int i = 0; i < decodedJson.length; i++) {
        Feeding f = Feeding.fromJson(decodedJson[i]);
        list.add(f);
      }
    }
    return list;
  }

  Future<String> saveFeeding(BuildContext context, Feeding entity) async{
    print('save');
    var url = url_path+'v1/feedings';
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
      return '';
    } else {
      return res.body;
    }
  }

//  void deleteFeeding(BuildContext context, int indexNumber) {
//    print('delete daily check');
//  }
}
