import 'package:farmapp/podo/daily_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardController {
  List<DailyCheck> _listDailyCheck = [];

  List<DailyCheck> getList() {
    return _listDailyCheck;
  }

  DailyCheck getDailyCheck(int indexX) {
    return _listDailyCheck[indexX];
  }

  int getListSize() {
    return _listDailyCheck.length;
  }
}
