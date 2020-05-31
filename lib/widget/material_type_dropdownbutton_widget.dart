import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/materi_type.dart';

class MaterialTypeDropdownButton extends StatefulWidget {
  TextEditingController tipe;
  MaterialTypeDropdownButton({Key key, this.tipe}) : super(key: key);

  @override
  _MaterialTypeDropdownButtonState createState() => _MaterialTypeDropdownButtonState();
}

class _MaterialTypeDropdownButtonState extends State<MaterialTypeDropdownButton> {
  MateriType selectedValue;
  List<MateriType> types = [];

  loadData() async{
    var url = url_path+'materialTypes/all';
    var res = await http.get(url);
    List decodedJson = jsonDecode(res.body);

    int code = res.statusCode;
    if (code == 200) {
      setState(() {
        for(int i=0; i<decodedJson.length; i++){
          MateriType m = MateriType.fromJson(decodedJson[i]);
          types.add(m);
        }
        if(types!=null && types.length>0) {
          for(int i=0; i<types.length; i++) {
            if(types[i].typeId.toString() == widget.tipe.text) {
              selectedValue = types[i];
            }
          }
        }
      });
    } else {
      print("Something went wrong");
    }
  }

  @override
  void initState() {
    super.initState();
      loadData();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<MateriType>(
      value: selectedValue,
      icon: Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: const Color(0xFF00796B)),
      underline: Container(
        height: 2,
        color: const Color(0xFF00796B),
      ),
      onChanged: (MateriType newValue) {

        setState(() {
          selectedValue = newValue;
          widget.tipe.text = newValue.typeId.toString();
        });
      },
      items: types.map((MateriType value){
        return DropdownMenuItem<MateriType>(
          value: value,
          child: Text(value.typeName),
        );
      }).toList(),
    );
  }

  MateriType getSelectedValue() {
    return selectedValue;
  }
}
