import 'package:farmapp/controller/main_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/group_category.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

class GroupCategoryDetail extends StatefulWidget {
  final GroupCategory groupCategory;
  final GroupCategory parent;
  const GroupCategoryDetail({this.groupCategory, this.parent});
  @override
  _GroupCategoryDetailState createState() => _GroupCategoryDetailState();
}

class _GroupCategoryDetailState extends State<GroupCategoryDetail> {
  GroupCategory gc;
  MainController mainController = MainController();
  final tcGroupCategoryName = TextEditingController();
  final tcGroupName = TextEditingController();
  final tcParent = TextEditingController();

  void _save() async {
    GroupCategory entity = GroupCategory();
    entity.groupCategoryName = tcGroupCategoryName.text;
    entity.groupName = tcGroupName.text;
    GroupCategory parentLocal = GroupCategory();
    parentLocal.groupCategoryId = int.parse(tcParent.text);
    entity.parent = parentLocal;

    var url = url_path + 'v1/groupCategories';
    var json = jsonEncode(entity.toJson());
    print(json);
    var res = await http.post(
      url,
      body: json,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    int code = res.statusCode;
    print(code);
    if (code == 200) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print("Something went wrong");
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.groupCategory == null && widget.parent == null) {
      gc = GroupCategory();
    } else if (widget.groupCategory == null && widget.parent != null) {
      gc = GroupCategory();
      gc.parent = widget.parent;
    } else if (widget.groupCategory != null && widget.parent != null) {
      gc = widget.groupCategory;
      gc.parent = widget.parent;
    } else if (widget.groupCategory != null && widget.parent == null) {
      gc = widget.groupCategory;
    }
  }

  @override
  Widget build(BuildContext context) {
    tcGroupCategoryName.text = gc.groupCategoryName;
    tcGroupName.text = gc.groupName;
    tcParent.text = gc.parent.groupCategoryName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: Text('Group Category'),
      ),
      body: Container(
        color: color_primary_light,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              height: height_textformfield,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: tcGroupCategoryName,
                ),
              ),
            ),
            Container(
              height: height_textformfield,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'Group Name'),
                    controller: tcGroupName),
              ),
            ),
            Container(
              height: height_textformfield,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'Parent'),
                    controller: tcParent),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonTheme(
              height: height_button_save,
              child: RaisedButton(
                onPressed: () {
                  _save();
                },
                color: Colors.teal,
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: size_button_save_text,
                      color: color_button_save_text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tcGroupCategoryName.dispose();
    tcGroupName.dispose();
    tcParent.dispose();
    super.dispose();
  }
}
