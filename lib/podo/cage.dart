import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/podo/livestock_type.dart';

class Cage {
  int cageId;
  String tag;
  GroupCategory region;
  GroupCategory farm;
  GroupCategory unit;
  double size;
  int drinkingCup;
  int feedingTray;
  int fan;
  String notes;
  LivestockType livestockType;
  bool deleted;
  String user;

  Cage() {}

  Cage.fromJson(Map<String, dynamic> json){
    cageId = json['cageId'];
    tag = json['tag'];
    var jsonRegion = json['region'];
    if(jsonRegion!=null) {
      region = GroupCategory();
      region.groupCategoryId = jsonRegion['groupCategoryId'];
      region.groupCategoryName = jsonRegion['groupCategoryName'];
    }
    var jsonFarm = json['farm'];
    if(jsonFarm!=null) {
      farm = GroupCategory();
      farm.groupCategoryId = jsonFarm['groupCategoryId'];
      farm.groupCategoryName = jsonFarm['groupCategoryName'];
    }
    var jsonUnit = json['unit'];
    if(jsonUnit!=null) {
      unit = GroupCategory();
      unit.groupCategoryId = jsonUnit['groupCategoryId'];
      unit.groupCategoryName = jsonUnit['groupCategoryName'];
    }
    size = json['size'];
    drinkingCup = json['drinkingCup'];
    feedingTray = json['feedingTray'];
    fan = json['fan'];
    notes = json['notes'];
    var jsonLivestockType = json['livestockType'];
    if(jsonLivestockType!=null) {
      livestockType = LivestockType();
      livestockType.livestockId = jsonLivestockType['livestockTypeId'];
      livestockType.livestockName = jsonLivestockType['livestockName'];
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.cageId!=null) {
      data['cageId'] = this.cageId.toString();
    }
    data['tag'] = this.tag;
    data['region'] = this.region;
    data['farm'] = this.farm;
    data['unit'] = this.unit;
    data['size'] = this.size.toString();
    data['drinkingCup'] = this.drinkingCup;
    data['feedingTray'] = this.feedingTray;
    data['fan'] = this.fan.toString();
    data['livestockType'] = this.livestockType;
    data['notes'] = this.notes;
    return data;
  }
}