import 'package:farmapp/podo/drawer_choice.dart';
import 'package:farmapp/widget/master_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/widget/user_widget.dart';
import 'package:farmapp/widget/dashboard_widget.dart';
import 'package:farmapp/widget/laporan_widget.dart';
import 'package:farmapp/widget/transaksi_widget.dart';
import 'package:farmapp/widget/welcome_widget.dart';

class MainController {
  String _title = 'Farm House';
  DrawerChoice _selectedDrawerChoice = DrawerChoice();

  String getTitle() {
    return _title;
  }

  List<DrawerChoice> choices = const <DrawerChoice>[
    const DrawerChoice(title: 'Dashboard', icon: Icons.multiline_chart),
    const DrawerChoice(title: 'Transaksi', icon: Icons.update),
    const DrawerChoice(title: 'Master', icon: Icons.storage),
    const DrawerChoice(title: 'User', icon: Icons.person),
    const DrawerChoice(title: 'Laporan', icon: Icons.library_books),
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