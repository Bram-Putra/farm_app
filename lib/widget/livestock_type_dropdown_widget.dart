import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/livestock_type.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/controller/livestock_type_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

class LivestockTypeDropdown extends StatefulWidget {
  TextEditingController tcLivestockType;
  LivestockTypeDropdown({Key key, this.tcLivestockType}) : super(key: key);

  @override
  _LivestockTypeDropdownState createState() => _LivestockTypeDropdownState();
}

class _LivestockTypeDropdownState extends State<LivestockTypeDropdown> {
  List<LivestockType> _listLivestockType = [];
  LivestockType livestockTypeValue;

  loadData() async {

    /* --GET LIVESTOCKTYPE-- */
    List<LivestockType> listlst = [];

    var url = url_path+'v1/livestockTypes?id=1';
    var res = await http.get(url);
    List decodedJson = jsonDecode(res.body);
    int code = res.statusCode;
    if (code == 200) {
      for (int i = 0; i < decodedJson.length; i++) {
        LivestockType r = LivestockType.fromJson(decodedJson[i]);
        _listLivestockType.add(r);
        listlst.add(r);
      }
    } else {
      print("Something went wrong");
    }

    if(widget.tcLivestockType.text!='') {
      livestockTypeValue = getLivestockTypeById(int.parse(widget.tcLivestockType.text));
    }
    setState(() {
    });
  }

  LivestockType getLivestockTypeById(int id) {
    LivestockType result;
    if(_listLivestockType!=null) {
      for (int i = 0; i < _listLivestockType.length; i++) {
        if (_listLivestockType[i].livestockId == id) {
          result = _listLivestockType[i];
          break;
        }
      }
    } else {
      print('list kosong');
    }
    return result;
  }

  void updateDropdownButton(LivestockType livestock) {
    livestockTypeValue = livestock;
    widget.tcLivestockType.text = livestockTypeValue.livestockId.toString();
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferred_height,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: <Widget>[
            Expanded(
              child: DropdownButton<LivestockType>(
                value: livestockTypeValue,
                icon: Icon(icon_dropdown),
                iconSize: dropdown_icon_size,
                elevation: dropdown_elevation,
                style: TextStyle(color: const Color(color_dropdown_text), fontSize: preferred_font_size),
                underline: Container(
                  height: 1.2,
                  color: const Color(color_divider),
                ),
                onChanged: (LivestockType newValue) {
                  updateDropdownButton(newValue);
                },
                items: _listLivestockType
                    .map<DropdownMenuItem<LivestockType>>((LivestockType value) {
                  return DropdownMenuItem<LivestockType>(
                    value: value,
                    child: Text(value.livestockName),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
