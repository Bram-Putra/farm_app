import 'package:farmapp/controller/main_controller.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/materi.dart';
import 'package:farmapp/podo/materi_type.dart';
import 'package:farmapp/widget/material_type_dropdownbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'livestock_type_dropdownbutton_widget.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

class MaterialDetail extends StatefulWidget {
  final Materi material;
  const MaterialDetail(this.material);
  @override
  _MaterialDetailState createState() => _MaterialDetailState();
}

class _MaterialDetailState extends State<MaterialDetail> {
  MainController mainController = MainController();

  final tcMaterialId = TextEditingController();
  final tcMaterialName = TextEditingController();
  final tcUom = TextEditingController();
  final tcNotes = TextEditingController();
  MateriType selectedType;
//  MaterialTypeDropdownButton dbTipe = MaterialTypeDropdownButton();
  final tcTipe = TextEditingController();

  void tertekan() async {
    Materi entity = Materi();
    entity.materialId = int.parse(tcMaterialId.text);
    entity.materialName = tcMaterialName.text;
    entity.uom = tcUom.text;
    MateriType tipe = MateriType();
    tipe.typeId = int.parse(tcTipe.text);
//    print(tcTipe.text);
    entity.materialType = tipe;
    entity.notes = tcNotes.text;

//    var url = 'http://192.168.1.7:9999/barn/v1/materials';
    var url = 'http://165.22.61.234:9999/barn/v1/materials';
    var json = jsonEncode(entity.toJson());
    print(json);
    var res = await http.post(url, body: json, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
//    print(res.body);
    int code = res.statusCode;
    print(code);
    if (code == 200) {
      setState(() {
//        Alert(
//            context: context,
//            title: 'Notice',
//            desc: res.body,
//        ).show();
        Navigator.pop(context);
      });
    } else {
      print("Something went wrong");
    }

  }

  @override
  Widget build(BuildContext context) {
    Materi m;
    if (widget.material == null) {
      m = Materi();
    } else {
      m = widget.material;
    }
    tcMaterialId.text = m.materialId.toString();
    tcMaterialName.text = m.materialName;
    tcUom.text = m.uom;
    tcNotes.text = m.notes;
    selectedType = m.materialType;
    tcTipe.text = m.materialType.typeId.toString();

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
            ListTile(
              title: Text('Material'),
              subtitle: Text(m.materialName),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Material Name'),
              controller: tcMaterialName,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'UOM'),
              controller: tcUom
            ),
            MaterialTypeDropdownButton(tipe: tcTipe),
            TextFormField(
              decoration: InputDecoration(labelText: 'Notes'),
              controller: tcNotes
            ),
//            TextFormField(
//              decoration: InputDecoration(labelText: 'Deleted'),
//              controller: tc6,
//            ),
//            TextFormField(
//              decoration: InputDecoration(labelText: 'User'),
//              controller: tc7,
//            ),
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
//    tc1.dispose();
//    tc2.dispose();
//    tc3.dispose();
//    tc4.dispose();
//    tc5.dispose();
//    tc6.dispose();
//    tc7.dispose();
//    tc8.dispose();
//    tc9.dispose();
//    tc10.dispose();
//    tc11.dispose();
//    tc12.dispose();
//    tc13.dispose();
    tcMaterialId.dispose();
    tcMaterialName.dispose();
    tcUom.dispose();
    tcNotes.dispose();
    super.dispose();
  }
}
