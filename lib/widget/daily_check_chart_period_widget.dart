import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/livestock_type.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/controller/livestock_type_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

class DailyCheckPeriodDropdown extends StatefulWidget {
  TextEditingController tcPeriod;
  DailyCheckPeriodDropdown({Key key, this.tcPeriod}) : super(key: key);

  @override
  _DailyCheckPeriodDropdownState createState() => _DailyCheckPeriodDropdownState();
}

class _DailyCheckPeriodDropdownState extends State<DailyCheckPeriodDropdown> {
  List<String> periods = [];
  String selectedPeriod = '';

  void updateDropdownButton(String period) {
    selectedPeriod = period;
    for(int i=0; i<periods.length; i++){
      if(periods[i]==period){
        widget.tcPeriod.text = (i+1).toString();
//        print(i.toString());
        break;
      }
    }
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    periods.add('1 Minggu');
    periods.add('2 Minggu');
    periods.add('3 Minggu');
    periods.add('4 Minggu');
    periods.add('5 Minggu');
    selectedPeriod = periods[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: selectedPeriod,
        icon: Icon(icon_dropdown),
        iconSize: size_dropdown_icon,
        elevation: elevation_dropdown,
        style: TextStyle(color: color_dropdown_text, fontSize: preferred_font_size),
        underline: Container(
          height: 1.2,
          color: color_divider,
        ),
        onChanged: (String newValue) {
          updateDropdownButton(newValue);
        },
        items: periods.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList()
    );
  }
}
