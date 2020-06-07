import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/widget/material_master_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/widget/cage_master_list_widget.dart';
import 'package:farmapp/widget/group_category_master_list_widget.dart';
import 'package:farmapp/widget/materi_type_master_list_widget.dart';
import 'package:farmapp/widget/livestock_type_master_list_widget.dart';

class MasterListController {
  int _bodyNumber = 0;

  void setBodyNumber(int body) {
    _bodyNumber = body;
  }

  int getBodyNumber() {
    return _bodyNumber;
  }

  StatefulWidget getBody() {
    if(_bodyNumber == 0) {
      return CageMasterList();
    } else if(_bodyNumber == 1){
      return MaterialMasterList();
    } else if(_bodyNumber == 2) {
      return MateriTypeMasterList();
    } else {
      return LivestockTypeMasterList();
    }
//    else {
//      return GroupCategoryMasterList();
//    }
  }
}