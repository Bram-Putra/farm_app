import 'package:farmapp/controller/main_controller.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/widget/group_category_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'livestock_type_dropdownbutton_widget.dart';

class CageDetail extends StatefulWidget {
  final Cage cage;
  const CageDetail(this.cage);
  @override
  _CageDetailState createState() => _CageDetailState();
}

class _CageDetailState extends State<CageDetail> {
  MainController mainController = MainController();

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

  void tertekan() {
    setState(() {
      Alert(
        context: context,
        title: 'Notice',
        desc: tc1.text +
            tc2.text +
            tc3.text +
            tc4.text +
            tc5.text +
            tc6.text +
            tc7.text +
            tc8.text +
            tc9.text +
            tc10.text +
            tc11.text +
            tc12.text +
            tc13.text,
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    Cage c;
    if (widget.cage == null) {
      c = Cage();
    } else {
      c = widget.cage;
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
              subtitle: Text(c.notes),
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
            LivestockTypeDropdownButton(),
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
                tertekan();
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
