import 'package:farmapp/controller/material_master_list_controller.dart';
import 'package:farmapp/podo/materi.dart';
import 'package:farmapp/widget/materi_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';

class MateriMasterList extends StatefulWidget {
  @override
  _MateriMasterListState createState() => _MateriMasterListState();
}

class _MateriMasterListState extends State<MateriMasterList> {
  MaterialMasterListController mmlController = MaterialMasterListController();
  List<Materi> _listMaterial;

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
    _listMaterial = mmlController.getList();

    var url = url_path+'v1/materials/all';
    var res = await http.get(url);
    List decodedJson = jsonDecode(res.body);

    int code = res.statusCode;
    if (code == 200) {
      setState(() {
        _listMaterial.clear();
        for (int i = 0; i < decodedJson.length; i++) {
          Materi m = Materi.fromJson(decodedJson[i]);
          _listMaterial.add(m);
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
        content: Text('Material $indexX akan dihapus'),
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
        mmlController.deleteMaterial(context, indexX);
        setState(() {
        });
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
              tag: 'icon_materi',
              child: Icon(
                icon_materi,
                color: Colors.white,
              ),
            ),
            title: Hero(
              tag: 'text_materi',
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
            onPressed: (){_callMaterialDetail(null);},
        ),
        body:Stack(
          children: <Widget>[
            Hero(tag: 'body_materi', child: Container(color: color_primary_white,)),
            ListView.builder(
                itemCount: mmlController.getListSize(),
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
                            title: Text('Material: '+mmlController.getMaterial(index).materialName),
                            subtitle: Text(mmlController.getMaterial(index).uom),
                            onTap: (){_callMaterialDetail(mmlController.getMaterial(index));},
                        ),
                    ),
                    secondaryActions: <Widget>[
                    IconSlideAction(
                        caption: 'Delete',
                        color: color_delete,
                        icon: Icons.delete,
                        onTap: () {_deleteRow(context, index);},
                    ),
                    ],
                );
                },
            ),
          ],
        )
    );
  }

  void _callMaterialDetail(Materi materialX) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialDetail(materialX)));
    setState(() {
      _loadData();
    });
  }
}
