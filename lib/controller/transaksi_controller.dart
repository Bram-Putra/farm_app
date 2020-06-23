import 'package:farmapp/widget/daily_check_list_widget.dart';
import 'package:farmapp/widget/feeding_list_widget.dart';
import 'package:farmapp/widget/mutasi_list_widget.dart';
import 'package:flutter/material.dart';

class TransaksiController {
  int _bodyNumber = 0;

  void setBodyNumber(int body) {
    _bodyNumber = body;
  }

  int getBodyNumber() {
    return _bodyNumber;
  }

  StatefulWidget getBody() {
    print(_bodyNumber);
    if(_bodyNumber == 0) {
      return DailyCheckList();
    } else if(_bodyNumber == 1) {
      return FeedingList();
    } else {
      return MutasiList();
    }
  }
}