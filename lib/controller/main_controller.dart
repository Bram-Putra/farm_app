import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/drawer_choice.dart';
import 'package:farmapp/widget/master_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/widget/user_widget.dart';
import 'package:farmapp/widget/dashboard_widget.dart';
import 'package:farmapp/widget/laporan_widget.dart';
import 'package:farmapp/widget/transaksi_widget.dart';
import 'package:farmapp/widget/welcome_widget.dart';

class MainController {
  DrawerChoice _selectedDrawerChoice = DrawerChoice();

  String getTitle() {
    if(_selectedDrawerChoice.title == 'Transaksi') {
      return 'Transaksi';
    } else if(_selectedDrawerChoice.title == 'Master') {
      return 'Master';
    } else if(_selectedDrawerChoice.title == 'User') {
      return 'User';
    } else if(_selectedDrawerChoice.title == 'Laporan') {
      return 'Laporan';
    } else if(_selectedDrawerChoice.title == 'Dashboard') {
      return 'Dashboard';
    } else {
      return 'Farm House';
    }
  }

  List<DrawerChoice> choices = const <DrawerChoice>[
    const DrawerChoice(title: 'Dashboard', icon: icon_dashboard),
    const DrawerChoice(title: 'Transaksi', icon: icon_transaksi),
    const DrawerChoice(title: 'Master', icon: icon_master),
    const DrawerChoice(title: 'User', icon: icon_user),
    const DrawerChoice(title: 'Laporan', icon: icon_laporan),
  ];

  void setSelectedDrawerChoice(DrawerChoice dc) {
    _selectedDrawerChoice = dc;
  }

  StatefulWidget getSelectedBody() {
    if(_selectedDrawerChoice.title == 'Transaksi') {
      return Transaksi();
    } else if(_selectedDrawerChoice.title == 'Master') {
      return MasterList();
    } else if(_selectedDrawerChoice.title == 'User') {
      return User();
    } else if(_selectedDrawerChoice.title == 'Laporan') {
      return Laporan();
    } else if(_selectedDrawerChoice.title == 'Dashboard') {
      return Dashboard();
    } else {
      return Welcome();
    }
  }
}