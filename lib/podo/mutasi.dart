import 'package:farmapp/podo/cage.dart';

class Mutasi {
  int movementId;
  String movementNumber;
  DateTime movementDate;
  Cage source;
  Cage destination;
  double quantity;
//  User user;

  Mutasi() {}

  Mutasi.fromJson(Map<String, dynamic> json){
    movementId = json['movementId'];
    movementNumber = json['movementNumber'];
    if(json['movementDate']!=null) {
      movementDate = DateTime.parse(json['movementDate']);
    }
    var jsonSource = json['source'];
    if(jsonSource!=null) {
      source = Cage.fromJson(jsonSource);
    }
    var jsonDestination = json['destination'];
    if(jsonDestination!=null) {
      destination = Cage.fromJson(jsonDestination);
    }
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.movementId!=null) {
      data['movementId'] = this.movementId;
    }
//    data['movementNumber'] = this.movementNumber;
//    data['movementDate'] = this.movementDate;
    data['source'] = this.source;
    data['destination'] = this.destination;
    data['quantity'] = this.quantity;
    return data;
  }
}