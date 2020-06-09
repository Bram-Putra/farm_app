import 'package:farmapp/controller/group_category_master_list_controller.dart';
import 'package:farmapp/controller/material_master_list_controller.dart';
import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/podo/materi.dart';
import 'package:farmapp/widget/materi_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';

class GroupCategoryMasterList extends StatefulWidget {
  @override
  _GroupCategoryMasterListState createState() => _GroupCategoryMasterListState();
}

class _GroupCategoryMasterListState extends State<GroupCategoryMasterList> {
  GroupCategoryMasterListController gcmlController = GroupCategoryMasterListController();
  List<GroupCategory> _listGroupCategory;

  loadData() async {
    _listGroupCategory = gcmlController.getList();

    var url = url_path+'v1/groupCategories/all';
    var res = await http.get(url);
    print(res.body);
    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
      setState(() {
        _listGroupCategory.clear();
        for (int i = 0; i < decodedJson.length; i++) {
          GroupCategory m = GroupCategory.fromJson(decodedJson[i]);
          _listGroupCategory.add(m);
        }
      });
    } else {
      print("Something went wrong");
    }
  }

  void _deleteRow(BuildContext context, int indexX) {
    bool confirmDelete = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete'),
        content: Text('Group Category $indexX will be deleted'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Confirm')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel')),
        ],
      ),
    ).then((value) {
      confirmDelete = value;
      if (confirmDelete) {
        gcmlController.deleteGroupCategory(context, indexX);
        setState(() {
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gcmlController.getListSize(),
      itemBuilder: (context, index) {
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(color_primary_light),
              border: Border(
                bottom: BorderSide(
                    color: const Color(color_divider),
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
            ),
            child: ListTile(
              title: Text('Group Category: '+gcmlController.getGroupCategory(index).groupCategoryName),
              subtitle: Text('Parent: '+gcmlController.getGroupCategory(index).parent.groupCategoryName),
              onTap: (){_callGroupCategoryDetail(gcmlController.getGroupCategory(index));},
            ),
          ),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: const Color(color_delete),
              icon: Icons.delete,
              onTap: () {
                _deleteRow(context, index);
              },
            ),
          ],
        );
      },
    );
  }

  void _callGroupCategoryDetail(GroupCategory gcX) async {
//    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => GroupCategoryDetail(gcX)));

    setState(() {
      loadData();
    });
  }
}
