import 'package:farmapp/widget/daily_check_list_widget.dart';
import 'package:farmapp/widget/materi_type_master_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/widget/cage_master_list_widget.dart';
import 'package:farmapp/widget/materi_master_list_widget.dart';
import 'package:farmapp/widget/livestock_type_master_list_widget.dart';

class TransaksiController {
  int _bodyNumber = 0;

  void setBodyNumber(int body) {
    _bodyNumber = body;
  }

  int getBodyNumber() {
    return _bodyNumber;
  }

  StatefulWidget getBody() {
//    if(_bodyNumber == 0) {
//      return DailyCheckList();
//    } else if(_bodyNumber == 1){
//      return
//    } else if(_bodyNumber == 2) {
//      return MateriTypeMasterList();
//    } else {
//      return LivestockTypeMasterList();
//    }
  return DailyCheckList();
  }
}