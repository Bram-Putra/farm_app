import 'package:farmapp/podo/materi.dart';
import 'package:farmapp/podo/materi_type.dart';
import 'package:flutter/material.dart';

class MateriTypeMasterListController {
  List<MateriType> _listMateriType = [];

  MateriTypeMasterListController() {
  }

  List<MateriType> getList() {
    return _listMateriType;
  }

  MateriType getMateriType(int indexX) {
    return _listMateriType[indexX];
  }

  int getListSize() {
    return _listMateriType.length;
  }

  void deleteMateriType(BuildContext context, int indexX) {
    _listMateriType.removeAt(indexX);
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Material Type $indexX is deleted'),
    behavior: SnackBarBehavior.floating,));
  }
}