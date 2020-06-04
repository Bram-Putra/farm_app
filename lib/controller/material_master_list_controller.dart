import 'package:farmapp/podo/materi.dart';
import 'package:flutter/material.dart';

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
}