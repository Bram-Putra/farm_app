import 'dart:convert';
import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/widget/group_category_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';
import 'group_category_unit_list.dart';

class GroupCategoryWilayahItems extends StatefulWidget {
  final int gcId;
  final String gcName;

  GroupCategoryWilayahItems(this.gcId, this.gcName);

  @override
  _GroupCategoryWilayahItemsState createState() =>
      _GroupCategoryWilayahItemsState();
}

class _GroupCategoryWilayahItemsState extends State<GroupCategoryWilayahItems> {
  PageStorageKey _key;
  Future<http.Response> _futureResponse;

  @override
  void initState() {
    super.initState();
    _futureResponse =
        http.get(url_path + 'v1/groupCategories?id=${widget.gcId}');
  }

  @override
  Widget build(BuildContext context) {
    _key = PageStorageKey('${widget.gcId}');
    return Container(
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
      child: Material(
        color: color_primary_light,
        child: GestureDetector(
          onLongPressStart: (LongPressStartDetails details) {
            _showAdditionalMenu(details.globalPosition, widget.gcId);
          },
          child: ExpansionTile(
            initiallyExpanded: false,
            key: _key,
            title: Text(
              widget.gcName,
              style: textstyle_listview_items,
            ),
            children: <Widget>[
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
                          InkWell(
                            onTap: () {
                              _callUnitList(element);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: color_primary_light,
                                  border: Border(
                                    top: BorderSide(
                                      color: color_divider,
                                      width: 0.5,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                                child: ListTile(
                                  leading: Hero(
                                    tag: 'text_wilayah' +
                                        element['groupCategoryName'],
                                    child: Text(
                                      element['groupCategoryName'],
                                      style: textstyle_listview_items,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    return Column(children: reasonList);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _showAdditionalMenu(Offset offset, int gcIdX) async {
    print(offset.toString());
    double left = offset.dx;
    double top = offset.dy;
    var result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem<String>(
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
            ),
            value: 'edit'),
        PopupMenuItem<String>(
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text('Tambah Sub-region'),
            ),
            value: 'tambah'),
      ],
      elevation: 8.0,
    );
    if (result == 'edit') {
      var url = url_path + 'v1/groupCategories/$gcIdX';
      var res = await http.get(url);
      int code = res.statusCode;
      if (code == 200) {
        var decodedJson = jsonDecode(res.body);
        GroupCategory gc = GroupCategory.fromJson(decodedJson);
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupCategoryDetail(
              groupCategory: gc,
              parent: gc.parent,
            ),
          ),
        );
      }
    } else {
      var url = url_path + 'v1/groupCategories/$gcIdX';
      var res = await http.get(url);
      int code = res.statusCode;
      if (code == 200) {
        var decodedJson = jsonDecode(res.body);
        GroupCategory gc = GroupCategory.fromJson(decodedJson);
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupCategoryDetail(
              groupCategory: null,
              parent: gc,
            ),
          ),
        );
      }
    }
  }

  void _callUnitList(dynamic parent) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => GroupCategoryUnitList(parent)));
  }
}
