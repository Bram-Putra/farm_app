import 'dart:convert';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/mutasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MutasiController {

  MutasiController() {}

  Future<List> getListMutasi() async{
    List<Mutasi> list = [];
    var url = url_path+'v1/movements/all';
    var res = await http.get(url);
    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
      for (int i = 0; i < decodedJson.length; i++) {
        Mutasi m = Mutasi.fromJson(decodedJson[i]);
        list.add(m);
      }
    }
    return list;
  }

  Future<String> saveMutasi(BuildContext context, Mutasi mutasi) async{
    print('save');
    var url = url_path+'v1/movements';
    var json = jsonEncode(mutasi.toJson());
    var res = await http.post(url,
        body: json,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    int code = res.statusCode;
    if (code == 200) {
      return "";
    } else {
      return res.body;
    }
  }

  void deleteMutasi(BuildContext context, int indexNumber) {
    print('[mutasi_controller.dart] belum ada isinya');
  }
}
