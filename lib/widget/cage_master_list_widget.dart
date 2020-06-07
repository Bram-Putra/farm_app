import 'package:farmapp/controller/cage_master_list_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/widget/cage_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

class CageMasterList extends StatefulWidget {
  @override
  _CageMasterListState createState() => _CageMasterListState();
}

class _CageMasterListState extends State<CageMasterList> {
  CageMasterListController cmlController = CageMasterListController();
  List<Cage> _listCage;

  loadData() async {
    _listCage = cmlController.getList();

    var url = url_path+'v1/cages/all';
    var res = await http.get(url);
//    print(decodedJson);

    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
      setState(() {
        _listCage.clear();
        for (int i = 0; i < decodedJson.length; i++) {
          Cage c = Cage.fromJson(decodedJson[i]);
          _listCage.add(c);
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
        content: Text('Kandang $indexX will be deleted'),
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
        cmlController.deleteCage(context, indexX);
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: const Color(color_primary_dark),
        onPressed: (){_callCageDetail(null);},
      ),
      body: ListView.builder(
        itemCount: cmlController.getListSize(),
        itemBuilder: (context, index) {
          int cageId = cmlController.getCageId(index);
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
                title: Text(cmlController.getCage(index).tag),
                subtitle: Text(cmlController.getCageNotes(index)),
                onTap: () {
                  _callCageDetail(cmlController.getCage(index));
                },
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
      ),
    );
  }

  void _callCageDetail(Cage cageX) async{
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => CageDetail(cageX)));
    setState(() {
      loadData();
    });
  }
}
