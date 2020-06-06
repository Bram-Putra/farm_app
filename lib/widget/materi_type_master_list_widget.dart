import 'package:farmapp/podo/materi_type.dart';
import 'package:farmapp/widget/materi_type_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/controller/materi_type_master_list_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';

class MateriTypeMasterList extends StatefulWidget {
  @override
  _MateriTypeMasterListState createState() => _MateriTypeMasterListState();
}

class _MateriTypeMasterListState extends State<MateriTypeMasterList> {
  MateriTypeMasterListController mtmlController =
      MateriTypeMasterListController();
  List<MateriType> _listMateriType = [];

  _loadData() async {
    var url = url_path + 'v1/materialTypes/all';
    var res = await http.get(url);
    List decodedJson = jsonDecode(res.body);
    int code = res.statusCode;
    if (code == 200) {
      _listMateriType.clear();
      for (int i = 0; i < decodedJson.length; i++) {
        MateriType m = MateriType.fromJson(decodedJson[i]);
        _listMateriType.add(m);
      }
      setState(() {});
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
        content: Text('Material Type $indexX will be deleted'),
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
        mtmlController.deleteMateriType(context, indexX);
        setState(() {});
      }
    });
  }


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: const Color(color_primary_dark),
        onPressed: (){_callMateriTypeDetail(null);},
      ),
      body: ListView.builder(
        itemCount: _listMateriType.length,
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
                title: Text('Material Type: ' +
                    _listMateriType[index].typeName),
                subtitle:
                    Text(_listMateriType[index].notes.toString()),
                onTap: () {
                  _callMateriTypeDetail(_listMateriType[index]);
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

  void _callMateriTypeDetail(MateriType mtX) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => MateriTypeDetail(mtX)));

    setState(() {
      _loadData();
    });
  }
}
