import 'package:flutter/material.dart';
import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/controller/group_category_controller.dart';

class GroupCategoryDropdown extends StatefulWidget {
  GroupCategoryDropdown({Key key}) : super(key: key);
  @override
  _GroupCategoryDropdownState createState() => _GroupCategoryDropdownState();
}

class _GroupCategoryDropdownState extends State<GroupCategoryDropdown> {
  static GroupCategoryController groupCategoryController = GroupCategoryController();
  static GroupCategory regionValue = groupCategoryController.getGroupCategoryByParent(null);
  static GroupCategory farmValue = groupCategoryController.getGroupCategoryByParent(regionValue);
  GroupCategory unitValue = groupCategoryController.getGroupCategoryByParent(farmValue);

  void updateDropdownButton(GroupCategory region, GroupCategory farm, GroupCategory unit) {
    if(region != null && farm == null && unit == null) {
      regionValue = region;
      farmValue  = groupCategoryController.getGroupCategoryByParent(regionValue);
      setState(() {
        unitValue = groupCategoryController.getGroupCategoryByParent(farmValue);
      });
    } else if(region == null && farm != null && unit == null) {
      farmValue = farm;
      setState(() {
        unitValue = groupCategoryController.getGroupCategoryByParent(farmValue);
      });
    } else {
      unitValue = unit;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: DropdownButton<GroupCategory>(
                value: regionValue,
                icon: Icon(Icons.expand_more),
                iconSize: 40,
                elevation: 16,
                style: TextStyle(color: const Color(0xFF00796B)),
                underline: Container(
                  height: 1.2,
                  color: const Color(0xFF9E9E9E),
                ),
                onChanged: (GroupCategory newValue) {
                  updateDropdownButton(newValue, null, null);
                },
                items: groupCategoryController
                    .getListGroupCategory(null)
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
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: DropdownButton<GroupCategory>(
                value: farmValue,
                icon: Icon(Icons.expand_more),
                iconSize: 40,
                elevation: 16,
                style: TextStyle(color: const Color(0xFF00796B)),
                underline: Container(
                  height: 1.2,
                  color: const Color(0xFF9E9E9E),
                ),
                onChanged: (GroupCategory newValue) {
                  updateDropdownButton(null, newValue, null);
                },
                items: groupCategoryController
                    .getListGroupCategory(regionValue)
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
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: DropdownButton<GroupCategory>(
                value: unitValue,
                icon: Icon(Icons.expand_more),
                iconSize: 40,
                elevation: 16,
                style: TextStyle(color: const Color(0xFF00796B)),
                underline: Container(
                  height: 1.2,
                  color: const Color(0xFF9E9E9E),
                ),
                onChanged: (GroupCategory newValue) {
                  updateDropdownButton(null, null, newValue);
                },
                items: groupCategoryController
                    .getListGroupCategory(farmValue)
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
      ],
    );
  }
}
