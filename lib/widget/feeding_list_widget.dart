import 'package:farmapp/controller/feeding_controller.dart';
import 'package:farmapp/controller/transaksi_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/feeding.dart';
import 'package:farmapp/widget/feeding_detail_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

class FeedingList extends StatefulWidget {
  @override
  _FeedingListState createState() => _FeedingListState();
}

class _FeedingListState extends State<FeedingList> {
  TransaksiController trController = TransaksiController();
  FeedingController fController = FeedingController();
  List<Feeding> _list = [];
  var df = DateFormat("dd MMM yyyy");

  loadData() async {
    Future<List> result = fController.selectFeedingList();
    result.then((value) => {
          print(value.length),
          _list.clear(),
          if (value.length > 0)
            {
              for (int i = 0; i < value.length; i++) {_list.add(value[i])},
              setState(() {})
            }
        });
  }

  void _showDetail(Feeding entity) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FeedingDetail(entity)));
    loadData();
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
            tag: 'icon_pemberian_pakan',
            child: Icon(
              icon_pemberian_pakan,
              color: color_text_white,
            ),
          ),
          title: Hero(
            tag: 'text_pemberian_pakan',
            child: Text(
              'Pemberian Pakan',
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
            tag: 'body_pemberian_pakan',
            child: Container(
              color: color_primary_white,
            ),
          ),
          ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Container(
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
                  title: Text(_list[index].cage.tag),
                  subtitle: Text(
                    'Last Update ' + df.format(_list[index].feedingDate),
                  ),
                  onTap: () {
                    _showDetail(_list[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
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
}
