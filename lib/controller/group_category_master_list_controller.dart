import 'package:farmapp/podo/group_category.dart';
import 'package:flutter/material.dart';

class GroupCategoryMasterListController {
  List<GroupCategory> _listGroupCategory = [];

  GroupCategoryMasterListController() {
  }

  List<GroupCategory> getList() {
    return _listGroupCategory;
  }

  GroupCategory getGroupCategory(int indexX) {
    return _listGroupCategory[indexX];
  }

  int getGroupCategoryId(int indexX) {
    return _listGroupCategory[indexX].groupCategoryId;
  }

  GroupCategory getGroupCategoryParent(int indexX) {
    return _listGroupCategory[indexX].parent;
  }

  int getListSize() {
    return _listGroupCategory.length;
  }

  void deleteGroupCategory(BuildContext context, int indexX) {
    _listGroupCategory.removeAt(indexX);
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Group Category $indexX is deleted'),
    behavior: SnackBarBehavior.floating,));
  }
}