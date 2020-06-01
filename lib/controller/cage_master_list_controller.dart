import 'package:farmapp/podo/cage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CageMasterListController {

  List<Cage> _listCage = [];

  CageMasterListController() {}

  List<Cage> getList() {
    return _listCage;
  }

  Cage getCage(int indexX) {
    return _listCage[indexX];
  }

  int getCageId(int indexX) {
    return _listCage[indexX].cageId;
  }

  String getCageNotes(int indexX) {
    return _listCage[indexX].notes;
  }

  int getListSize() {
    return _listCage.length;
  }

  void deleteCage(BuildContext context, int indexX) {
    _listCage.removeAt(indexX);
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Kandang $indexX is deleted'),
    behavior: SnackBarBehavior.floating,));
  }
}
