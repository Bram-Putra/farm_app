import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/materi_type.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;


class MateriTypeDetail extends StatefulWidget {
  final MateriType materiType;
  const MateriTypeDetail(this.materiType);
  @override
  _MateriTypeDetailState createState() => _MateriTypeDetailState();
}

class _MateriTypeDetailState extends State<MateriTypeDetail> {
  final tcMateriTypeId = TextEditingController();
  final tcMateriTypeName = TextEditingController();
  final tcNotes = TextEditingController();

  void save() async {
    MateriType entity = MateriType();
    entity.typeId = tcMateriTypeId.text==''? null: int.parse(tcMateriTypeId.text);
    entity.typeName = tcMateriTypeName.text;
    entity.notes = tcNotes.text;

    var url = url_path+'v1/materialTypes';
    var json = jsonEncode(entity.toJson());
    print(json);
    var res = await http.post(url, body: json, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    int code = res.statusCode;
    print(code);
    if (code == 200) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    MateriType m;
    if (widget.materiType == null) {
      m = MateriType();
    } else {
      m = widget.materiType;
    }
    tcMateriTypeId.text = m.typeId.toString();
    tcMateriTypeName.text = m.typeName;
    tcNotes.text = m.notes;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Icon(
            icon_materi_type,
            color: Colors.white,
          ),
          title: Text(
            'Material',
            style: textstyle_appbar,
          ),
        ),
      ),
      body: Container(
        color: color_primary_light,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              height: height_textformfield,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Material Type'),
                  initialValue: tcMateriTypeName.text,
                  enabled: false,
                ),
              ),
            ),
            Container(
              height: height_textformfield,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Material Type Name'),
                  controller: tcMateriTypeName,
                ),
              ),
            ),
            Container(
              height: height_textformfield,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Notes'),
                  controller: tcNotes
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            ButtonTheme(
              height: height_button_save,
              child: RaisedButton(
                onPressed: () {
                  save();
                },
                color: Colors.teal,
                child: Text('Save', style: TextStyle(fontSize: size_button_save_text, color: color_button_save_text),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tcMateriTypeId.dispose();
    tcMateriTypeName.dispose();
    tcNotes.dispose();
    super.dispose();
  }
}
