import 'package:farmapp/podo/cage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CageMasterListController {

  //TODO: [Mr. I] populate Cage here:
//  Cage _cage1 = Cage();
//  Cage _cage2 = Cage();
//  Cage _cage3 = Cage();
//  Cage _cage4 = Cage();
  List<Cage> _listCage = [];

  CageMasterListController() {
    //TODO: [Mr. I] dummy data:
//    _cage1.cageId = 1;
//    _cage1.notes = 'Kandang pertama';
//    _cage2.cageId = 2;
//    _cage2.notes = 'Kandang kedua';
//    _cage3.cageId = 3;
//    _cage3.notes = 'Kandang ketiga';
//    _cage4.cageId = 4;
//    _cage4.notes = 'Kandang keempat';
//
//    _listCage = [_cage1, _cage2, _cage3, _cage4];
  }

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
