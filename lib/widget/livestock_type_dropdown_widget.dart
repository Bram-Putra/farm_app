import 'package:farmapp/podo/barn_constant.dart';
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
        ),
      ),
    );
  }
}
