import 'user.dart';

class MateriType {
  int typeId;
  String typeName;
  String notes;
  bool deleted;
  User user;

  MateriType() {}

  MateriType.fromJson(Map<String, dynamic> json){
    typeId = json['typeId'];
    typeName = json['typeName'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeId'] = this.typeId;
    data['typeName'] = this.typeName;
    data['notes'] = this.notes;
    return data;
  }
}