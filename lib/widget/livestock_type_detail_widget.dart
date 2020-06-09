import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/livestock_type.dart';
import 'package:flutter/material.dart';

class LivestockTypeDetail extends StatefulWidget {
  final LivestockType livestockType;
  const LivestockTypeDetail(this.livestockType);
  @override
  _LivestockTypeDetailState createState() => _LivestockTypeDetailState();
}

class _LivestockTypeDetailState extends State<LivestockTypeDetail> {
  final tcLivestockTypeId = TextEditingController();
  final tcLivestockTypeName = TextEditingController();
  final tcNotes = TextEditingController();

  void save() async {
    LivestockType entity = LivestockType();
    entity.livestockId = tcLivestockTypeId.text==''? null: int.parse(tcLivestockTypeId.text);
    entity.livestockName = tcLivestockTypeName.text;
    entity.notes = tcNotes.text;

    var url = url_path + 'v1/livestockTypes';
    var json = jsonEncode(entity.toJson());
    print(json);
    var res = await http.post(
      url,
      body: json,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
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
    LivestockType lst;
    if (widget.livestockType != null) {
      lst = widget.livestockType;
      tcLivestockTypeId.text = lst.livestockId.toString();
      tcLivestockTypeName.text = lst.livestockName;
      tcNotes.text = lst.notes;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(color_primary_dark),
        title: ListTile(
          leading: Icon(
            icon_livestock,
            color: Colors.white,
          ),
          title: Text(
            'Livestock',
            style: appbar_textstyle,
          ),
        ),
      ),
      body: Container(
        color: const Color(color_primary_light),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Livestock Type ID'),
                  controller: tcLivestockTypeId,
                  enabled: false,
                ),
              ),
            ),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Livestock Type Name'),
                  controller: tcLivestockTypeName,
                ),
              ),
            ),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Notes'),
                  controller: tcNotes,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonTheme(
              height: raised_button_height,
              child: RaisedButton(
                onPressed: () {
                  save();
                },
                color: color_raised_button,
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: raised_button_font_size,
                      color: color_raised_button_text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tcLivestockTypeId.dispose();
    tcLivestockTypeName.dispose();
    tcNotes.dispose();
    super.dispose();
  }
}
