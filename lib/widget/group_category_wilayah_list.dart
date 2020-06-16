import 'package:farmapp/widget/group_category_wilayah_items.dart';
import 'package:flutter/material.dart';

class GroupCategoryWilayahList extends StatelessWidget {
  final List<dynamic> elementList;

  GroupCategoryWilayahList(this.elementList);

  List<Widget> _getChildren() {
    List<Widget> children = [];
    elementList.forEach((element) {
      children.add(
        GroupCategoryWilayahItems(element['groupCategoryId'], element['groupCategoryName']),
      );
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getChildren(),
    );
  }
}
