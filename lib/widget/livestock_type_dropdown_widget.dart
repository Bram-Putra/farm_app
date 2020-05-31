import 'package:farmapp/podo/livestock_type.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/controller/livestock_type_controller.dart';

class LivestockTypeDropdown extends StatefulWidget {
  LivestockTypeDropdown({Key key}) : super(key: key);

  @override
  _LivestockTypeDropdownState createState() => _LivestockTypeDropdownState();
}

class _LivestockTypeDropdownState extends State<LivestockTypeDropdown> {
  static LivestockTypeController livestockTypeController = LivestockTypeController();
  LivestockType livestockTypeValue = livestockTypeController.getLivestockType(0);

  void updateDropdownButton(LivestockType livestock) {
    setState(() {
      livestockTypeValue = livestock;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: DropdownButton<LivestockType>(
            value: livestockTypeValue,
            icon: Icon(Icons.expand_more),
            iconSize: 40,
            elevation: 16,
            style: TextStyle(color: const Color(0xFF00796B)),
            underline: Container(
              height: 1,
              color: const Color(0xFF00796B),
            ),
            onChanged: (LivestockType newValue) {
              updateDropdownButton(newValue);
            },
            items: livestockTypeController.getListLivestockType()
                .map<DropdownMenuItem<LivestockType>>((LivestockType value) {
              return DropdownMenuItem<LivestockType>(
                value: value,
                child: Text(value.livestockName),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
