import 'package:farmapp/podo/livestock_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LivestockTypeMasterListController {

  List<LivestockType> _listLivestockType = [];

  LivestockTypeMasterListController() {}

  List<LivestockType> getList() {
    return _listLivestockType;
  }

  LivestockType getLivestockType(int indexX) {
    return _listLivestockType[indexX];
  }

  int getLivestockTypeId(int indexX) {
    return _listLivestockType[indexX].livestockId;
  }

  String getLivestockTypeNotes(int indexX) {
    return _listLivestockType[indexX].notes;
  }

  int getListSize() {
    return _listLivestockType.length;
  }

  void deleteLivestockType(BuildContext context, int indexX) {
    _listLivestockType.removeAt(indexX);
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Livestock Type $indexX is deleted'),
    behavior: SnackBarBehavior.floating,));
  }
}
