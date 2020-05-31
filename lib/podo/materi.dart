import 'package:farmapp/podo/materi_type.dart';

import 'user.dart';

class Materi {
  int materialId;
  String materialName;
  String uom;
  MateriType materialType;
  String notes;

  Materi() {}

  Materi.fromJson(Map<String, dynamic> json){
    materialId = json['materialId'];
    materialName = json['materialName'];
    uom = json['uom'];
    var tipe = json['type'];
    materialType = MateriType();
    materialType.typeId = tipe['typeId'];
    materialType.typeName = tipe['typeName'];
    materialType.notes = tipe['notes'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['materialId'] = this.materialId.toString();
    data['materialName'] = this.materialName;
    data['uom'] = this.uom;
    data['type'] = this.materialType;
    data['notes'] = this.notes;
    return data;
  }
}