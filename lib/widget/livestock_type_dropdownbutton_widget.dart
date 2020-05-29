import 'package:farmapp/podo/livestock_type.dart';
import 'package:flutter/material.dart';

class LivestockTypeDropdownButton extends StatefulWidget {
  LivestockTypeDropdownButton({Key key}) : super(key: key);

  @override
  _LivestockTypeDropdownButtonState createState() => _LivestockTypeDropdownButtonState();
}

class _LivestockTypeDropdownButtonState extends State<LivestockTypeDropdownButton> {
  LivestockType livestockType = LivestockType();
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: const Color(0xFF00796B)),
      underline: Container(
        height: 2,
        color: const Color(0xFF00796B),
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
