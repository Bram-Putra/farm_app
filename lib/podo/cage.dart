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
}