import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/user.dart';

class DailyCheck {
  int checkId;
  String checkNumber;
  String checkDate;
  double alive;
  double dead;
  double harvest;
  double averageWeight;
  double temperature;
  double humidity;
  Cage cage;
  User user;


  DailyCheck({this.checkId, this. checkNumber, this.checkDate, this.alive, this.dead, this.harvest, this.averageWeight, this.temperature, this.humidity, this.cage});

  DailyCheck.fromJson(Map<String, dynamic> json){
    checkId = json['checkId'];
    checkNumber = json['checkNumber'];
    checkDate = json['checkDate'];
    alive = json['alive'];
    dead = json['dead'];
    harvest = json['harvest'];
    averageWeight = json['averageWeight'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    var vCage = json['cage'];
    if(vCage != null) {
      cage = Cage();
      cage.cageId = vCage['cageId'];
      cage.tag = vCage['tag'];
    }
  }
}