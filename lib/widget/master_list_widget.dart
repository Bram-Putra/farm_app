import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:farmapp/controller/master_list_controller.dart';

class MasterList extends StatefulWidget {
  @override
  _MasterListState createState() => _MasterListState();
}

class _MasterListState extends State<MasterList> {
  MasterListController masterListController = MasterListController();

  void _setSelectedIndex(int i) {
    setState(() {
      masterListController.setBodyNumber(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: masterListController.getBody(),
      bottomNavigationBar: ConvexAppBar(
        curveSize: 60.0,
        top: -14.0,
        backgroundColor: color_primary_dark,
        items: [
          TabItem(icon: icon_kandang, title: 'Kandang'),
          TabItem(icon: icon_materi, title: 'Material'),
          TabItem(icon: icon_materi_type, title: 'Type'),
          TabItem(icon: icon_livestock, title: 'Livestock'),
//          TabItem(icon: icon_group_type, title: 'Group')
        ],
        initialActiveIndex: masterListController.getBodyNumber(),
        onTap: (int i) {
          _setSelectedIndex(i);
        },
      ),
    );
  }
}