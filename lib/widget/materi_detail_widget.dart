import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/materi.dart';
import 'package:farmapp/podo/materi_type.dart';
import 'package:farmapp/widget/material_type_dropdownbutton_widget.dart';
import 'package:flutter/material.dart';
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
  final tcMaterialId = TextEditingController();
  final tcMaterialName = TextEditingController();
  final tcUom = TextEditingController();
  final tcNotes = TextEditingController();
  MateriType selectedType;
//  MaterialTypeDropdownButton dbTipe = MaterialTypeDropdownButton();
  final tcTipe = TextEditingController();

  void save() async {
    Materi entity = Materi();
    if (tcMaterialId.text != '') {
      entity.materialId = int.parse(tcMaterialId.text);
    }
    entity.materialName = tcMaterialName.text;
    entity.uom = tcUom.text;
    MateriType tipe = MateriType();
    tipe.typeId = int.parse(tcTipe.text);
//    print(tcTipe.text);
    entity.materialType = tipe;
    entity.materialType = tipe;
    entity.notes = tcNotes.text;

    var url = url_path + 'v1/materials';
    var json = jsonEncode(entity.toJson());
//    print(json);
    var res = await http.post(
      url,
      body: json,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    int code = res.statusCode;
//    print(code);
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
    Materi m;
    if (widget.material == null) {
      m = Materi();
    } else {
      m = widget.material;
      tcMaterialId.text = m.materialId.toString();
      tcMaterialName.text = m.materialName;
      tcUom.text = m.uom;
      tcNotes.text = m.notes;
      selectedType = m.materialType;
      tcTipe.text = m.materialType.typeId.toString();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Icon(
            icon_materi,
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
                  decoration: InputDecoration(labelText: 'Material'),
                  initialValue: tcMaterialName.text,
                  enabled: false,
                ),
              ),
            ),
            Container(
              height: height_textformfield,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Material Name'),
                  controller: tcMaterialName,
                ),
              ),
            ),
            Container(
              height: height_textformfield,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'UOM'),
                    controller: tcUom),
              ),
            ),
            MaterialTypeDropdownButton(tipe: tcTipe),
            Container(
              height: height_textformfield,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'Notes'),
                    controller: tcNotes),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonTheme(
              height: height_button_save,
              child: RaisedButton(
                onPressed: () {
                  save();
                },
                color: Colors.teal,
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: size_button_save_text,
                      color: color_button_save_text),
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
    tcMaterialId.dispose();
    tcMaterialName.dispose();
    tcUom.dispose();
    tcNotes.dispose();
    super.dispose();
  }
}
