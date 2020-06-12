import 'dart:convert';

import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/materi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MaterialMasterListController {
  Materi _material1 = Materi();
  Materi _material2 = Materi();
  Materi _material3 = Materi();
  Materi _material4 = Materi();
  List<Materi> _listMaterial = [];

  MaterialMasterListController() {
  }

  List<Materi> getList() {
    return _listMaterial;
  }

  Materi getMaterial(int indexX) {
    return _listMaterial[indexX];
  }

  int getMaterialId(int indexX) {
    return _listMaterial[indexX].materialId;
  }

  String getMaterialNotes(int indexX) {
    return _listMaterial[indexX].notes;
  }

  int getListSize() {
    return _listMaterial.length;
  }

  void deleteMaterial(BuildContext context, int indexX) {
    _listMaterial.removeAt(indexX);
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Material $indexX is deleted'),
    behavior: SnackBarBehavior.floating,));
  }

  Future<List> selectMaterials() async{
    List<Materi> list = [];
    var url = url_path+'v1/materials/all';
    var res = await http.get(url);
    print(res.body);

    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
//      print(decodedJson);
      for (int i = 0; i < decodedJson.length; i++) {
        Materi m = Materi.fromJson(decodedJson[i]);
        list.add(m);
      }
    }
    return list;
  }
}