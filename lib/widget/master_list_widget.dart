import 'package:farmapp/icon/custom_icon_barn.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:farmapp/controller/master_list_controller.dart';
import 'package:farmapp/widget/cage_detail_widget.dart';
import 'package:farmapp/podo/cage.dart';

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
        backgroundColor: const Color(0xFF455A64),
        items: [
          TabItem(icon: icon_kandang, title: 'Kandang'),
          TabItem(icon: icon_materi, title: 'Material'),
          TabItem(icon: icon_materi_type, title: 'Material Type'),
          TabItem(icon: icon_livestock, title: 'Livestock'),
        ],
        initialActiveIndex: masterListController.getBodyNumber(),
        onTap: (int i) {
          _setSelectedIndex(i);
        },
      ),
    );
  }
}
