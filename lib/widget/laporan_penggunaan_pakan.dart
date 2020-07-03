import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/food_conversion_rate.dart';
import 'package:flutter/material.dart';

class LaporanPenggunaanPakan extends StatefulWidget {
  List<FoodConversionRate> list;
  LaporanPenggunaanPakan(this.list);
  @override
  _LaporanPenggunaanPakanState createState() => _LaporanPenggunaanPakanState();
}

class _LaporanPenggunaanPakanState extends State<LaporanPenggunaanPakan> {
//  String dropdownValue = '';
  List<FoodConversionRate> _listFoodConversionRate = [];

//  void populateListFoodConversionRate(String ageX) {
//    int age = int.parse(ageX.substring(0, 1));
//    _listFoodConversionRate.clear();
//    for(int i = 0; i < widget.list.length; i++) {
//      FoodConversionRate f = widget.list[i];
//      if(f.age == age) {
//        _listFoodConversionRate.add(f);
//      }
//    }
//    setState(() {
//    });
//  }

  @override
  void initState() {
//    super.initState();
//    dropdownValue = '1 minggu';
//    populateListFoodConversionRate(dropdownValue);
    _listFoodConversionRate = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Penggunaan Pakan'),
        backgroundColor: color_primary_dark,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text('Usia'),
//                SizedBox(width: 8.0,),
//                DropdownButton<String>(
//                  value: dropdownValue,
//                  icon: Icon(icon_dropdown),
//                  iconSize: size_dropdown_icon,
//                  elevation: elevation_dropdown,
//                  onChanged: (String newValue) {
//                    dropdownValue = newValue;
//                    populateListFoodConversionRate(dropdownValue);
//                  },
//                  items: <String>[
//                    '1 minggu',
//                    '2 minggu',
//                    '3 minggu',
//                    '4 minggu',
//                    '5 minggu'
//                  ].map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value),
//                    );
//                  }).toList(),
//                ),
//              ],
//            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                horizontalMargin: 8.0,
                columnSpacing: 24.0,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Kandang',
                      style: textstyle_column,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Usia',
                      style: textstyle_column,
                    ),
                  ),
                  DataColumn(
                    numeric: true,
                    label: Text(
                      'Pakan',
                      style: textstyle_column,
                    ),
                  ),
                  DataColumn(
                    numeric: true,
                    label: Text(
                      'Berat',
                      style: textstyle_column,
                    ),
                  ),
                  DataColumn(
                    numeric: true,
                    label: Text(
                      'FCR',
                      style: textstyle_column,
                    ),
                  ),
                ],
                rows: _listFoodConversionRate
                    .map(
                      (entity) => DataRow(
                        cells: [
                          DataCell(Text(entity.cage)),
                          DataCell(Center(child: Text(entity.age.toString()))),
                          DataCell(
                            Text(entity.foodConsumption.toString()),
                          ),
                          DataCell(Text(entity.weightGain.toString())),
                          DataCell(Text(entity.fcr.toString())),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
