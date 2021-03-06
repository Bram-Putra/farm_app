import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/livestock_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:farmapp/podo/cage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LivestockTypeDetailController {
  saveLivestockType(BuildContext context, LivestockType livestockType) async {
    var url = url_path+'v1/livestockTypes';
    var json = jsonEncode(livestockType.toJson());
    print(json);
    var res = await http.post(url,
        body: json,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    int code = res.statusCode;
    print(code);
    if (code == 200) {
      Navigator.pop(context);
    } else {
      print("Something went wrong");
    }
  }
}