import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/dummy/group_category_dummy.dart';

class GroupCategoryController {
  GroupCategoryDummy _dummyData;
  List<GroupCategory> _listGroupCategory;

  GroupCategoryController() {
    _dummyData = GroupCategoryDummy();
    _listGroupCategory = _dummyData.getListGroupCategory();
  }

  List<GroupCategory> getListGroupCategory(GroupCategory parent) {
    List<GroupCategory> localListGroupCategory = [];
    for(int i = 0; i < _listGroupCategory.length; i++) {
      if(_listGroupCategory[i].parent == parent) {
        localListGroupCategory.add(_listGroupCategory[i]);
      }
    }
    return localListGroupCategory;
  }

  GroupCategory getGroupCategory(int index) {
    return _listGroupCategory[index];
  }

  GroupCategory getGroupCategoryByParent(GroupCategory parent) {
    for(int i = 0; i < _listGroupCategory.length; i++) {
      if(_listGroupCategory[i].parent == parent) {
        return _listGroupCategory[i];
      }
    }
  }
}