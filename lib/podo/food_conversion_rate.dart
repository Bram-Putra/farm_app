import 'package:farmapp/podo/cage.dart';

class FoodConversionRate {
  int id;
  String cage;
  int age;
  double foodConsumption;
  double weightGain;
  double fcr;

  FoodConversionRate.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cage = json['cage'];
    age = json['age'];
    foodConsumption = json['foodConsumption'];
    weightGain = json['weightGain'];
    fcr = json['fcr'];
  }
}