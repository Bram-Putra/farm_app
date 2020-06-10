import 'package:flutter/material.dart';
import 'package:farmapp/podo/group_category.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';

class GroupCategoryDropdown extends StatefulWidget {
  TextEditingController tcRegion;
  TextEditingController tcFarm;
  TextEditingController tcUnit;
  GroupCategoryDropdown({Key key, this.tcRegion, this.tcFarm, this.tcUnit}) : super(key: key);

  @override
  _GroupCategoryDropdownState createState() => _GroupCategoryDropdownState();
}

class _GroupCategoryDropdownState extends State<GroupCategoryDropdown> {
  List<GroupCategory> _listGroupCategory = [];
  GroupCategory parentGroup = GroupCategory(groupCategoryId: 1);
  GroupCategory regionValue;
  GroupCategory farmValue;
  GroupCategory unitValue;

  loadData() async {

    /* --GET REGION-- */
    List<GroupCategory> regions = [];
    List<GroupCategory> farms = [];
    List<GroupCategory> units = [];

    var url = url_path+'v1/groupCategories?id=1';
    var res = await http.get(url);

//    print(decodedJson);

    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
//      setState(() {
//        regions.clear();
        for (int i = 0; i < decodedJson.length; i++) {
          GroupCategory r = GroupCategory.fromJson(decodedJson[i]);
          _listGroupCategory.add(r);
          regions.add(r);
        }
//      });
    } else {
      print("Something went wrong");
    }
//    print(regions.length.toString());
    /* --GET FARM-- */
    for(int x=0; x<regions.length; x++) {
      GroupCategory r = regions[x];
      url = url_path+'v1/groupCategories?id='+r.groupCategoryId.toString();
      res = await http.get(url);

//      print(decodedJson);

      int code = res.statusCode;
      if (code == 200) {
        List decodedJson = jsonDecode(res.body);
//        setState(() {
//          farms.clear();
          for (int i = 0; i < decodedJson.length; i++) {
            GroupCategory f = GroupCategory.fromJson(decodedJson[i]);
            _listGroupCategory.add(f);
            farms.add(f);
          }
//        });
      } else {
        print("Something went wrong");
      }
    }
//    print(farms.length.toString());
    /* --GET UNIT-- */
    for(int x=0; x<farms.length; x++) {
      GroupCategory f = farms[x];
//      print(f.groupCategoryId.toString());
      url = url_path+'v1/groupCategories?id='+f.groupCategoryId.toString();
      res = await http.get(url);

//      print(decodedJson);

      int code = res.statusCode;
      if (code == 200) {
        List decodedJson = jsonDecode(res.body);
//        setState(() {
//          units.clear();
          for (int i = 0; i < decodedJson.length; i++) {
            GroupCategory u = GroupCategory.fromJson(decodedJson[i]);
            _listGroupCategory.add(u);
          }
//        });
      } else {
        print("Something went wrong");
      }
    }
//    print(_listGroupCategory);
//    print('selesai load');
//    for(int z=0; z<_listGroupCategory.length; z++){
//      print(_listGroupCategory[z].groupCategoryId.toString()+'=='+_listGroupCategory[z].groupCategoryName+'=='+_listGroupCategory[z].parent.groupCategoryId.toString());
//    }

    setState(() {
//      GroupCategory parentGroup = GroupCategory(groupCategoryId: 1);
      if(widget.tcRegion.text!=''){
        regionValue = getGroupById(int.parse(widget.tcRegion.text));
      } else {
        regionValue = getGroupCategoryByParent(parentGroup);
        widget.tcRegion.text = regionValue.groupCategoryId.toString();
      }
//      print('region value: '+regionValue.groupCategoryId.toString());
      if(widget.tcFarm.text!=''){
        farmValue = getGroupById(int.parse(widget.tcFarm.text));
      } else {
        farmValue = getGroupCategoryByParent(regionValue);
        widget.tcFarm.text = farmValue.groupCategoryId.toString();
      }
//      print('farm value: '+farmValue.groupCategoryId.toString());
      if(widget.tcUnit.text!=''){
        unitValue = getGroupById(int.parse(widget.tcUnit.text));
      } else {
        unitValue = getGroupCategoryByParent(farmValue);
        widget.tcUnit.text = unitValue.groupCategoryId.toString();
      }
//    print('unit value: '+unitValue.groupCategoryId.toString());
    });
  }

  void updateDropdownButton(GroupCategory region, GroupCategory farm, GroupCategory unit) {
    if(region != null && farm == null && unit == null) {
      setState(() {
        regionValue = region;
        farmValue  = getGroupCategoryByParent(regionValue);
        unitValue = getGroupCategoryByParent(farmValue);
        widget.tcRegion.text = regionValue.groupCategoryId.toString();
        widget.tcFarm.text = farmValue.groupCategoryId.toString();
        widget.tcUnit.text = unitValue.groupCategoryId.toString();
      });

    } else if(region == null && farm != null && unit == null) {
      setState(() {
        farmValue = farm;
        unitValue = getGroupCategoryByParent(farmValue);
        widget.tcFarm.text = farmValue.groupCategoryId.toString();
        widget.tcUnit.text = unitValue.groupCategoryId.toString();
      });
    } else {
      setState(() {
        unitValue = unit;
        widget.tcUnit.text = unitValue.groupCategoryId.toString();
      });
    }
  }


  @override
  void initState() {
    super.initState();
//    GroupCategory regionValue = groupCategoryController.getGroupCategoryByParent(parentGroup);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: preferred_height,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButton<GroupCategory>(
                    value: regionValue,
                    icon: Icon(icon_dropdown),
                    iconSize: dropdown_icon_size,
                    elevation: dropdown_elevation,
                    style: TextStyle(color: color_dropdown_text, fontSize: preferred_font_size),
                    underline: Container(
                      height: 1.2,
                      color: color_divider,
                    ),
                    onChanged: (GroupCategory newValue) {
                      updateDropdownButton(newValue, null, null);
                    },
                    items: getListGroupCategory(parentGroup)
                        .map<DropdownMenuItem<GroupCategory>>((GroupCategory gc) {
                      return DropdownMenuItem<GroupCategory>(
                        value: gc,
                        child: Text(gc.groupCategoryName),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: preferred_height,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButton<GroupCategory>(
                    value: farmValue,
                    icon: Icon(icon_dropdown),
                    iconSize: dropdown_icon_size,
                    elevation: dropdown_elevation,
                    style: TextStyle(color: color_dropdown_text, fontSize: preferred_font_size),
                    underline: Container(
                      height: 1.2,
                      color: color_divider,
                    ),
                    onChanged: (GroupCategory newValue) {
                      updateDropdownButton(null, newValue, null);
                    },
                    items: getListGroupCategory(regionValue)
                        .map<DropdownMenuItem<GroupCategory>>((GroupCategory gc) {
                      return DropdownMenuItem<GroupCategory>(
                        value: gc,
                        child: Text(gc.groupCategoryName),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: preferred_height,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButton<GroupCategory>(
                    value: unitValue,
                    icon: Icon(icon_dropdown),
                    iconSize: dropdown_icon_size,
                    elevation: dropdown_elevation,
                    style: TextStyle(color: color_dropdown_text, fontSize: preferred_font_size),
                    underline: Container(
                      height: 1.2,
                      color: color_divider,
                    ),
                    onChanged: (GroupCategory newValue) {
                      updateDropdownButton(null, null, newValue);
                    },
                    items: getListGroupCategory(farmValue)
                        .map<DropdownMenuItem<GroupCategory>>((GroupCategory gc) {
                      return DropdownMenuItem<GroupCategory>(
                        value: gc,
                        child: Text(gc.groupCategoryName),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  GroupCategory getGroupCategoryByParent(GroupCategory parent) {
//    print(parent.groupCategoryId);
    GroupCategory result;
    if(_listGroupCategory!=null) {
      for (int i = 0; i < _listGroupCategory.length; i++) {
        if (_listGroupCategory[i].parent.groupCategoryId == parent.groupCategoryId) {
          result = _listGroupCategory[i];
          break;
        }
      }
    } else {
      print('list kosong');
    }
    return result;
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

  GroupCategory getGroupById(int id) {
//    print(parent.groupCategoryId);
    GroupCategory result;
    if(_listGroupCategory!=null) {
      for (int i = 0; i < _listGroupCategory.length; i++) {
        if (_listGroupCategory[i].groupCategoryId == id) {
          result = _listGroupCategory[i];
          break;
        }
      }
    } else {
      print('list kosong');
    }
    return result;
  }
}
