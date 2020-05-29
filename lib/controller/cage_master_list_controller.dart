import 'package:farmapp/podo/cage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CageMasterListController {
  Cage _cage1 = Cage();
  Cage _cage2 = Cage();
  Cage _cage3 = Cage();
  Cage _cage4 = Cage();
  List<Cage> _listCage = [];

  //TODO: [Bram] populate Cage here:
  CageMasterListController() {
    _cage1.cageId = 1;
    _cage1.notes = 'Kandang pertama';
    _cage2.cageId = 2;
    _cage2.notes = 'Kandang kedua';
    _cage3.cageId = 3;
    _cage3.notes = 'Kandang ketiga';
    _cage4.cageId = 4;
    _cage4.notes = 'Kandang keempat';

    _listCage = [_cage1, _cage2, _cage3, _cage4];
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
        .showSnackBar(SnackBar(content: Text('Kandang $indexX is deleted')));
  }
}
