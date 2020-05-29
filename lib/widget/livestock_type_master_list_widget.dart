import 'package:flutter/material.dart';

class LivestockTypeMasterList extends StatefulWidget {
  @override
  _LivestockTypeMasterListState createState() => _LivestockTypeMasterListState();
}

class _LivestockTypeMasterListState extends State<LivestockTypeMasterList> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: RaisedButton.icon(onPressed: null, icon: Icon(Icons.change_history), label: Text('Livestock Type'),),));
  }
}
