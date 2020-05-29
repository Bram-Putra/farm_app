import 'package:flutter/material.dart';

class MaterialTypeMasterList extends StatefulWidget {
  @override
  _MaterialTypeMasterListState createState() => _MaterialTypeMasterListState();
}

class _MaterialTypeMasterListState extends State<MaterialTypeMasterList> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: RaisedButton.icon(onPressed: null, icon: Icon(Icons.donut_large), label: Text('Material Type'),),));
  }
}
