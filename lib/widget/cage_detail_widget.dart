import 'package:farmapp/controller/main_controller.dart';
import 'package:farmapp/controller/cage_detail_controller.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/widget/group_category_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'livestock_type_dropdown_widget.dart';

class CageDetail extends StatefulWidget {
  final Cage cage;
  const CageDetail(this.cage);
  @override
  _CageDetailState createState() => _CageDetailState();
}

class _CageDetailState extends State<CageDetail> {
  MainController mainController = MainController();
  CageDetailController _cageDetailController = CageDetailController();

  final tc1 = TextEditingController();
  final tc2 = TextEditingController();
  final tc3 = TextEditingController();
  final tc4 = TextEditingController();
  final tc5 = TextEditingController();
  final tc6 = TextEditingController();
  final tc7 = TextEditingController();
  final tc8 = TextEditingController();
  final tc9 = TextEditingController();
  final tc10 = TextEditingController();
  final tc11 = TextEditingController();
  final tc12 = TextEditingController();
  final tc13 = TextEditingController();

  void _save() {
    bool confirmSave = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Save'),
        content: Text('Save data?'),
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
      confirmSave = value;
      if (confirmSave) {
        //TODO: [Mr. I] please add the save command here:
        Cage cage = Cage();
        _cageDetailController.saveCage(context, cage);
        setState(() {
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Cage cageLocal;
    if (widget.cage == null) {
      cageLocal = Cage();
      cageLocal.cageId = null;
      cageLocal.tag = '';
      cageLocal.size = 0.0;
      cageLocal.drinkingCup = 0;
      cageLocal.feedingTray = 0;
      cageLocal.fan = 0;
      cageLocal.notes = '';
      cageLocal.deleted = false;
      cageLocal.user = '';
    } else {
      cageLocal = widget.cage;
    }
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
            GroupCategoryDropdown(),
            ListTile(
              title: Text('Cage ID'),
              subtitle: Text(cageLocal.cageId.toString()),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Tag'),
              controller: tc2,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Size'),
              controller: tc6,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Drinking Cup'),
              controller: tc7,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Feeding Tray'),
              controller: tc8,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Fan'),
              controller: tc9,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Notes'),
              controller: tc10,
            ),
            SizedBox(
              height: 20.0,
            ),
            LivestockTypeDropdown(),
            TextFormField(
              decoration: InputDecoration(labelText: 'Deleted'),
              controller: tc12,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'User'),
              controller: tc13,
            ),
            RaisedButton(
              onPressed: () {
                _save();
              },
              color: Colors.teal,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tc1.dispose();
    tc2.dispose();
    tc3.dispose();
    tc4.dispose();
    tc5.dispose();
    tc6.dispose();
    tc7.dispose();
    tc8.dispose();
    tc9.dispose();
    tc10.dispose();
    tc11.dispose();
    tc12.dispose();
    tc13.dispose();
    super.dispose();
  }
}
