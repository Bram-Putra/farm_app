import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/feeding_material.dart';
import 'package:intl/intl.dart';

class Feeding {
  int feedingId;
  String feedingNumber;
  DateTime feedingDate;
  Cage cage;
  String notes;
  List<FeedingMaterial> materials = [];
//  User user;


  Feeding() {}

  Feeding.fromJson(Map<String, dynamic> json){
    feedingId = json['feedingId'];
    feedingNumber = json['feedingNumber'];
    if(json['feedingDate']!=null) {
      feedingDate = DateTime.parse(json['feedingDate']);
    }
    notes = json['notes'];
    var jsonCage = json['cage'];
    if(jsonCage!=null) {
      cage = Cage.fromJson(jsonCage);
    }
    var jsonMaterials = json['materials'];
    if(jsonMaterials!=null){
      for(int i=0; i<jsonMaterials.length; i++){
        var jsonMateri = jsonMaterials[i];
        FeedingMaterial fm = FeedingMaterial.fromJson(jsonMateri);
        materials.add(fm);
      }
    }

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.feedingId!=null) {
      data['feedingId'] = this.feedingId;
    }
    data['cage'] = this.cage;
    data['notes'] = this.notes;
    data['materials'] = this.materials;
    return data;
  }
}