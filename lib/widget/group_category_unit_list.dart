import 'package:flutter/material.dart';
import 'package:farmapp/podo/group_category.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';

class GroupCategoryUnitList extends StatefulWidget {
  final dynamic parent;
  GroupCategoryUnitList(this.parent);
  @override
  _GroupCategoryUnitListState createState() => _GroupCategoryUnitListState();
}

class _GroupCategoryUnitListState extends State<GroupCategoryUnitList> {
  List<GroupCategory> _listUnit = [];
  PageStorageKey _key;
  Future<http.Response> _futureResponse;

  _loadData() async {
    /* --GET UNIT-- */
    var url = url_path + 'v1/groupCategories?id=' + widget.parent.toString();
    var res = await http.get(url);
    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
      _listUnit.clear();
      for (int i = 0; i < decodedJson.length; i++) {
        GroupCategory gc = GroupCategory.fromJson(decodedJson[i]);
        _listUnit.add(gc);
        print(gc.groupCategoryName + '\n');
      }
    } else {
      print("Something went wrong when trying to load Unit" + '\n');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureResponse = http.get(
        url_path + 'v1/groupCategories?id=${widget.parent['groupCategoryId']}');
  }

  @override
  Widget build(BuildContext context) {
    _key = PageStorageKey('${widget.parent['groupCategoryId']}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Icon(
            icon_group_category,
            color: Colors.white,
          ),
          title: Hero(
            tag: 'text_wilayah'+widget.parent['groupCategoryName'],
            child: Text(
              widget.parent['groupCategoryName'],
              style: appbar_textstyle,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Kembali ke halaman utama',
            onPressed: () {
              goHome();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
//            SizedBox(
//              height: 40.0,
//              child: Container(
//                decoration: BoxDecoration(
//                  color: color_primary_light,
//                  border: Border(
//                    bottom: BorderSide(
//                      color: color_divider,
//                      width: 1.0,
//                      style: BorderStyle.solid,
//                    ),
//                  ),
//                ),
//                child: Center(
//                  child: Text(
//                    widget.parent['groupCategoryName'],
//                    style: listview_textstyle_header,
//                  ),
//                ),
//              ),
//            ),
            FutureBuilder(
              future: _futureResponse,
              builder: (BuildContext context,
                  AsyncSnapshot<http.Response> response) {
                if (!response.hasData) {
                  return const Center(
                    child: const Text('Loading...'),
                  );
                } else if (response.data.statusCode != 200) {
                  return const Center(
                    child: const Text('Error loading data'),
                  );
                } else {
                  List<dynamic> listGC = jsonDecode(response.data.body);
                  List<Widget> reasonList = [];
                  listGC.forEach(
                    (element) {
                      reasonList.add(
                        Container(
                          decoration: BoxDecoration(
                            color: color_primary_light,
                            border: Border(
                              bottom: BorderSide(
                                color: color_divider,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Text(element['groupCategoryName']),
                          ),
                        ),
                      );
                    },
                  );
                  return Column(children: reasonList);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void goHome() {
    bool confirmed = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Kembali'),
        content: Text('Kembali ke halaman utama?'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Iya')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Tidak')),
        ],
      ),
    ).then((value) {
      confirmed = value;
      if (confirmed) {
        Navigator.of(context).popUntil(
          ModalRoute.withName('/'),
        );
      }
    });
  }
}