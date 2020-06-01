import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/dummy/group_category_dummy.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GroupCategoryController {
  GroupCategoryDummy _dummyData;
  List<GroupCategory> _listGroupCategory = [];

  GroupCategoryController() {
//    _dummyData = GroupCategoryDummy();
    loadData();
//    _listGroupCategory = _dummyData.getListGroupCategory();
  }

  loadData() async {

    /* --GET REGION-- */
    List<GroupCategory> regions = [];
    List<GroupCategory> farms = [];
    List<GroupCategory> units = [];

    var url = url_path+'v1/groupCategories?id=1';
    var res = await http.get(url);
    List decodedJson = jsonDecode(res.body);
    print(decodedJson);

    int code = res.statusCode;
    if (code == 200) {
      regions.clear();
      for (int i = 0; i < decodedJson.length; i++) {
        GroupCategory r = GroupCategory.fromJson(decodedJson[i]);
        _listGroupCategory.add(r);
        regions.add(r);
      }
    } else {
      print("Something went wrong");
    }

    /* --GET FARM-- */
    for(int x=0; x<regions.length; x++) {
      GroupCategory r = regions[x];
      url = url_path+'v1/groupCategories?id='+r.groupCategoryId.toString();
      res = await http.get(url);
      List decodedJson = jsonDecode(res.body);
      print(decodedJson);

      int code = res.statusCode;
      if (code == 200) {
        farms.clear();
        for (int i = 0; i < decodedJson.length; i++) {
          GroupCategory f = GroupCategory.fromJson(decodedJson[i]);
          _listGroupCategory.add(f);
        }
      } else {
        print("Something went wrong");
      }
    }

    /* --GET UNIT-- */
    for(int x=0; x<farms.length; x++) {
      GroupCategory f = farms[x];
      url = url_path+'v1/groupCategories?id='+f.groupCategoryId.toString();
      res = await http.get(url);
      List decodedJson = jsonDecode(res.body);
      print(decodedJson);

      int code = res.statusCode;
      if (code == 200) {
        units.clear();
        for (int i = 0; i < decodedJson.length; i++) {
          GroupCategory u = GroupCategory.fromJson(decodedJson[i]);
          _listGroupCategory.add(u);
        }
      } else {
        print("Something went wrong");
      }
    }
//    print(_listGroupCategory);
    print('selesai load');
  }

  List<GroupCategory> getListGroupCategory(GroupCategory parent) {
    List<GroupCategory> localListGroupCategory = [];
    if(parent!=null) {
      if (_listGroupCategory != null) {
        for (int i = 0; i < _listGroupCategory.length; i++) {
          if (_listGroupCategory[i].parent.groupCategoryId ==
              parent.groupCategoryId) {
            localListGroupCategory.add(_listGroupCategory[i]);
          }
        }
      }
    }
    return localListGroupCategory;
  }

  GroupCategory getGroupCategory(int index) {
    return _listGroupCategory[index];
  }

  GroupCategory getGroupCategoryByParent(GroupCategory parent) {
    print(parent.groupCategoryId);
    if(_listGroupCategory!=null) {
      for (int i = 0; i < _listGroupCategory.length; i++) {
        if (_listGroupCategory[i].parent.groupCategoryId == parent.groupCategoryId) {
          return _listGroupCategory[i];
        }
      }
    } else {
      print('list kosong');
    }
  }
}