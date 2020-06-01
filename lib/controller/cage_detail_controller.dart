import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:farmapp/podo/cage.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';

class CageDetailController {

   saveCage(BuildContext context, Cage cage) async {
    var url = url_path+'v1/cages';
    var json = jsonEncode(cage.toJson());
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
//      setState(() {
//        Alert(
//            context: context,
//            title: 'Notice',
//            desc: res.body,
//        ).show();
      Navigator.pop(context);
//      });
    } else {
      print("Something went wrong");
    }
  }
}