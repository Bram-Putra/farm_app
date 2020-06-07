import 'package:farmapp/podo/cage.dart';
import 'package:intl/intl.dart';

class DailyCheck {
  int checkId;
  String checkNumber;
  DateTime checkDate;
  double alive;
  double dead;
  double harvest;
  double averageWeight;
  double temperature;
  double humidity;
  Cage cage;
  String notes;
//  User user;


  DailyCheck() {}

  DailyCheck.fromJson(Map<String, dynamic> json){
    checkId = json['checkId'];
    checkNumber = json['checkNumber'];
    if(json['checkDate']!=null) {
      checkDate = DateTime.parse(json['checkDate']);
    }
    alive = json['alive'];
    dead = json['dead'];
    harvest = json['harvest'];
    averageWeight = json['averageWeight'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    notes = json['notes'];
    var jsonCage = json['cage'];
    if(jsonCage!=null) {
      cage = Cage.fromJson(jsonCage);
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.checkId!=null) {
      data['checkId'] = this.checkId;
    }
//    data['checkNumber'] = this.checkNumber;
//    data['checkDate'] = this.checkDate;
    data['alive'] = this.alive;
    data['dead'] = this.dead;
    data['harvest'] = this.harvest;
    data['averageWeight'] = this.averageWeight;
    data['temperature'] = this.temperature;
    data['humidity'] = this.humidity;
    data['cage'] = this.cage;
    data['notes'] = this.notes;
    return data;
  }
}