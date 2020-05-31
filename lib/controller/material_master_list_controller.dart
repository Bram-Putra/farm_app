import 'package:farmapp/podo/materi.dart';
import 'package:flutter/material.dart';

class MaterialMasterListController {
  Materi _material1 = Materi();
  Materi _material2 = Materi();
  Materi _material3 = Materi();
  Materi _material4 = Materi();
  List<Materi> _listMaterial = [];

  MaterialMasterListController() {
//    _material1.materialId = 11;
//    _material1.materialName = "Dedak Padi";
//    MateriType tipe1 = MateriType();
//    tipe1.typeId = 1;
//    tipe1.typeName = "Pakan";
//    _material1.materialType = tipe1;
//    _material1.notes = 'Material pertama';
//    _material2.materialId = 12;
//    _material2.materialName = "Jagung Butir";
//    _material2.materialType = tipe1;
//    _material2.notes = 'Material kedua';
//    _material3.materialId = 13;
//    _material3.materialName = "Vitamin A";
//    _material3.materialType = tipe1;
//    _material3.notes = 'Material ketiga';
//    _material4.materialId = 14;
//    _material4.materialName = "Vitamin B";
//    _material4.materialType = tipe1;
//    _material4.notes = 'Material keempat';

//    _listMaterial = [_material1, _material2, _material3, _material4];
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