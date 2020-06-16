import 'package:flutter/material.dart';
import 'package:farmapp/controller/livestock_type_master_list_controller.dart';
import 'package:farmapp/podo/livestock_type.dart';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'livestock_type_detail_widget.dart';

class LivestockTypeMasterList extends StatefulWidget {
  @override
  _LivestockTypeMasterListState createState() =>
      _LivestockTypeMasterListState();
}

class _LivestockTypeMasterListState extends State<LivestockTypeMasterList> {
  LivestockTypeMasterListController ltmlController =
      LivestockTypeMasterListController();
  List<LivestockType> _listLivestockType;

  void goHome() {
    bool confirmed = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Kembali'),
        content: Text('Kembali ke halaman utama?'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Iya')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Tidak')),
        ],
      ),
    ).then((value) {
      confirmed = value;
      if (confirmed) {
        Navigator.of(context).popUntil(
          ModalRoute.withName('/'),
        );
      }
    });
  }

  _loadData() async {
    _listLivestockType = ltmlController.getList();

    var url = url_path + 'v1/livestockTypes/all';
    var res = await http.get(url);
//    print(res.body);
    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
      _listLivestockType.clear();
      for (int i = 0; i < decodedJson.length; i++) {
        LivestockType lst = LivestockType.fromJson(decodedJson[i]);
        _listLivestockType.add(lst);
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
        content: Text('Livestock $indexX akan dihapus'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Konfirmasi')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Batal')),
        ],
      ),
    ).then((value) {
      confirmDelete = value;
      if (confirmDelete) {
        ltmlController.deleteLivestockType(context, indexX);
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
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Hero(
            tag: 'icon_livestock',
            child: Icon(
              icon_livestock,
              color: Colors.white,
            ),
          ),
          title: Hero(
            tag: 'text_livestock_type',
            child: Text(
              'Livestock Type',
              style: appbar_textstyle,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Kembali ke halaman utama',
            onPressed: () {
              goHome();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: color_primary_dark,
        onPressed: () {
          _callLivestockTypeDetail(null);
        },
      ),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'body_livestock',
            child: Container(
              color: color_primary_white,
            ),
          ),
          ListView.builder(
            itemCount: _listLivestockType.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                child: Container(
                  decoration: BoxDecoration(
                    color: color_primary_light,
                    border: Border(
                      bottom: BorderSide(
                          color: color_divider,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                  ),
                  child: ListTile(
                    title: Text('Livestock: ' +
                        _listLivestockType[index].livestockName),
                    subtitle: Text('Notes: ' + _listLivestockType[index].notes),
                    onTap: () {
                      _callLivestockTypeDetail(_listLivestockType[index]);
                    },
                  ),
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: color_delete,
                    icon: Icons.delete,
                    onTap: () {
                      _deleteRow(context, index);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _callLivestockTypeDetail(LivestockType lstX) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => LivestockTypeDetail(lstX)));
    setState(() {
      _loadData();
    });
  }
}
