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
        backgroundColor: const Color(0xFF455A64),
        items: [
          TabItem(icon: Icons.check_box_outline_blank, title: 'Kandang'),
          TabItem(icon: Icons.dns, title: 'Material'),
          TabItem(icon: Icons.donut_large, title: 'Material Type'),
          TabItem(icon: Icons.change_history, title: 'Livestock'),
        ],
        initialActiveIndex: masterListController.getBodyNumber(),
        onTap: (int i) {
          _setSelectedIndex(i);
        },
      ),
    );
  }
}
