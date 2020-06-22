import 'package:farmapp/podo/materi_type.dart';
import 'package:farmapp/widget/materi_type_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/controller/materi_type_master_list_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:convert';
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
        content: Text('Material Type $indexX akan dihapus'),
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
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Hero(
            tag: 'icon_materi_type',
            child: Icon(
              icon_materi_type,
              color: Colors.white,
            ),
          ),
          title: Hero(
            tag: 'text_materi_type',
            child: Text(
              'Material',
              style: textstyle_appbar,
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
        onPressed: (){_callMateriTypeDetail(null);},
      ),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'body_materi_type',
            child: Container(
              color: color_primary_white,
            ),
          ),
          ListView.builder(
            itemCount: _listMateriType.length,
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

  void _callMateriTypeDetail(MateriType mtX) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => MateriTypeDetail(mtX)));

    setState(() {
      _loadData();
    });
  }
}
