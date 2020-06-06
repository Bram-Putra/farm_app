import 'package:farmapp/controller/main_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/podo/materi.dart';
import 'package:farmapp/podo/materi_type.dart';
import 'package:farmapp/widget/material_type_dropdownbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;


class GroupCategoryDetail extends StatefulWidget {
  final GroupCategory groupCategory;
  const GroupCategoryDetail(this.groupCategory);
  @override
  _GroupCategoryDetailState createState() => _GroupCategoryDetailState();
}

class _GroupCategoryDetailState extends State<GroupCategoryDetail> {
  MainController mainController = MainController();

  GroupCategory parentGlobal;
  final tcGroupCategoryId = TextEditingController();
  final tcGroupCategoryName = TextEditingController();
  final tcGroupName = TextEditingController();
  final tcParent = TextEditingController();

  void save() async {
    GroupCategory entity = GroupCategory();
    entity.groupCategoryId = int.parse(tcGroupCategoryId.text);
    entity.groupCategoryName = tcGroupCategoryName.text;
    entity.groupName = tcGroupName.text;
    GroupCategory parentLocal = GroupCategory();
    parentLocal.groupCategoryId = int.parse(tcParent.text);
    entity.parent = parentLocal;

    var url = url_path+'v1/groupCategories';
    var json = jsonEncode(entity.toJson());
    print(json);
    var res = await http.post(url, body: json, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
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
  Widget build(BuildContext context) {
    GroupCategory gc;
    if (widget.groupCategory == null) {
      gc = GroupCategory();
    } else {
      gc = widget.groupCategory;
    }
    if(gc.parent != null) {
      parentGlobal = gc.parent;
    } else {
      parentGlobal = GroupCategory();
    }
    tcGroupCategoryId.text = gc.groupCategoryId.toString();
    tcGroupCategoryName.text = gc.groupCategoryName;
    tcGroupName.text = gc.groupName;
    tcParent.text = gc.parent.groupCategoryName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF455A64),
        title: Text(mainController.getTitle()),
      ),
      body: Container(
        color: const Color(0xFFCFD8DC),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Material'),
                  initialValue: tcGroupCategoryName.text,
                  enabled: false,
                ),
              ),
            ),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Material Name'),
                  controller: tcGroupCategoryName,
                ),
              ),
            ),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'UOM'),
                  controller: tcGroupName
                ),
              ),
            ),
//            MaterialTypeDropdownButton(tipe: tcTipe),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Notes'),
                  controller: tcParent
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            ButtonTheme(
              height: raised_button_height,
              child: RaisedButton(
                onPressed: () {
                  save();
                },
                color: Colors.teal,
                child: Text('Save', style: TextStyle(fontSize: raised_button_font_size, color: color_raised_button_text),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tcGroupCategoryId.dispose();
    tcGroupCategoryName.dispose();
    tcGroupName.dispose();
    tcParent.dispose();
    super.dispose();
  }
}
