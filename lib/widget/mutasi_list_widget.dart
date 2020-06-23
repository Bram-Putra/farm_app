import 'package:farmapp/controller/mutasi_controller.dart';
import 'package:farmapp/controller/transaksi_controller.dart';
import 'package:farmapp/podo/mutasi.dart';
import 'package:farmapp/widget/mutasi_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:ui';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:intl/intl.dart';

class MutasiList extends StatefulWidget {
  @override
  _MutasiListState createState() => _MutasiListState();
}

class _MutasiListState extends State<MutasiList> {
  TransaksiController trController = TransaksiController();
  MutasiController mController = MutasiController();
  List<Mutasi> _listMutasi = [];
  var df = DateFormat("dd MMM yyyy");

  loadData() async {
    Future<List> result = mController.getListMutasi();
    result.then(
      (value) => {
        _listMutasi.clear(),
        if (value.length > 0)
          {
            for (int i = 0; i < value.length; i++) {_listMutasi.add(value[i])},
            setState(() {}),
          },
      },
    );
  }

  void _showDetail(Mutasi entity) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MutasiDetail(entity)));
    loadData();
  }

  void _deleteRow(BuildContext context, int indexNumber) {
    bool confirmDelete = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete'),
        content: Text('Apakah Anda yakin akan menghapus baris ini?'),
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
        mController.deleteMutasi(context, indexNumber);
        _listMutasi.removeAt(indexNumber);
        setState(() {});
      }
    });
  }

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

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Hero(
            tag: 'icon_mutasi',
            child: Icon(
              icon_mutasi,
              color: Colors.white,
            ),
          ),
          title: Hero(
            tag: 'text_mutasi',
            child: Text(
              'Mutasi',
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
        onPressed: () {
          _showDetail(null);
        },
      ),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'body_mutasi',
            child: Container(
              color: color_primary_white,
            ),
          ),
          ListView.builder(
            itemCount: _listMutasi.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFCFD8DC),
                    border: Border(
                      bottom: BorderSide(
                          color: const Color(0xFFBDBDBD),
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                  ),
                  child: ListTile(
                    title: Text('Mutasi dari ' +
                        _listMutasi[index].source.tag +
                        ' ke ' +
                        _listMutasi[index].destination.tag),
                    subtitle: Text(
                      'Last update ' +
                          df.format(_listMutasi[index].movementDate),
                    ),
                    onTap: () {
                      _showDetail(_listMutasi[index]);
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
}
