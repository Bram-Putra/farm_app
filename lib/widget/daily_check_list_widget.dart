import 'package:farmapp/controller/daily_check_controller.dart';
import 'package:farmapp/controller/transaksi_controller.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:farmapp/podo/materi.dart';
import 'package:farmapp/widget/daily_check_detail_widget.dart';
import 'package:farmapp/widget/material_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';
import 'package:intl/intl.dart';

class DailyCheckList extends StatefulWidget {
  @override
  _DailyCheckListState createState() => _DailyCheckListState();
}

class _DailyCheckListState extends State<DailyCheckList> {
  TransaksiController trController = TransaksiController();
  DailyCheckController dcController = DailyCheckController();
  List<DailyCheck> _list = [];

  loadData() async {
    print('load data');
    Future<List> result = dcController.selectDailyCheck();
    result.then((value) => {
      print(value.length),
      _list.clear(),
      if(value.length>0){
        for(int i=0; i<value.length; i++){
          _list.add(value[i])
        },
        setState(() {})
      }
    });
  }

  void _showDetail(DailyCheck entity) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => DailyCheckDetail(entity)));
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
              child: Text('Confirm')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel')),
        ],
      ),
    ).then((value) {
      confirmDelete = value;
      if (confirmDelete) {
        dcController.deleteDailyCheck(context, indexNumber);
        _list.removeAt(indexNumber);
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
    var df = DateFormat("dd MMM yyyy");
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: const Color(0xFF455A64),
          onPressed: (){
            _showDetail(null);
          },
        ),
        body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            int dailyCheckId = _list[index].checkId;
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
                  title: Text(_list[index].cage.tag),
                  subtitle: Text('Last update '+df.format(_list[index].checkDate)),
                  onTap: (){
                    _showDetail(_list[index]);
                  },
                ),
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Delete',
                  color: const Color(0xFFFF5252),
                  icon: Icons.delete,
                  onTap: () {
                    _deleteRow(context, index);
                  },
                ),
              ],
            );
          },
        )
    );
  }


}
