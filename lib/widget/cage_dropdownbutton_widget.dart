import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

class CageDropdownButton extends StatefulWidget {
  TextEditingController tcCage;
  CageDropdownButton({Key key, this.tcCage}) : super(key: key);

  @override
  _CageDropdownButtonState createState() => _CageDropdownButtonState();
}

class _CageDropdownButtonState extends State<CageDropdownButton> {
  Cage selectedValue;
  List<Cage> cages = [];

  loadData() async{
    var url = url_path+'v1/cages/all';
    var res = await http.get(url);

    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
      setState(() {
        for(int i=0; i<decodedJson.length; i++){
          Cage c = Cage.fromJson(decodedJson[i]);
          cages.add(c);
        }
        if(cages!=null && cages.length>0) {
          if(widget.tcCage.text!='') {
            for (int i = 0; i < cages.length; i++) {
              if (cages[i].cageId.toString() == widget.tcCage.text) {
                selectedValue = cages[i];
              }
            }
          } else {
            selectedValue = cages[0];
          }
          widget.tcCage.text = selectedValue.cageId.toString();
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
    return DropdownButton<Cage>(
      value: selectedValue,
      icon: Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: const Color(0xFF00796B)),
      underline: Container(
        height: 2,
        color: const Color(0xFF00796B),
      ),
      onChanged: (Cage newValue) {
        setState(() {
          selectedValue = newValue;
          widget.tcCage.text = newValue.cageId.toString();
        });
      },
      items: cages.map((Cage value){
        return DropdownMenuItem<Cage>(
          value: value,
          child: Text(value.tag),
        );
      }).toList(),
    );
  }

  Cage getSelectedValue() {
    return selectedValue;
  }
}
