import 'dart:convert';
import 'package:farmapp/podo/group_category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';
import 'group_category_unit_list.dart';

class GroupCategoryWilayahItems extends StatefulWidget {
  final int gcId;
  final String gcName;

  GroupCategoryWilayahItems(this.gcId, this.gcName);

  @override
  _GroupCategoryWilayahItemsState createState() => _GroupCategoryWilayahItemsState();
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
      child: ExpansionTile(
        initiallyExpanded: false,
        key: _key,
        title: Text(widget.gcName, style: listview_textstyle_items,),
        children: <Widget>[
          FutureBuilder(
            future: _futureResponse,
            builder:
                (BuildContext context, AsyncSnapshot<http.Response> response) {
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
                      GestureDetector(
                        onTap: () {
                          _callUnitList(element);
                        },
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
                            title: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Hero(
                                tag: 'text_wilayah'+element['groupCategoryName'],
                                child: Text(
                                  element['groupCategoryName'],
                                  style: listview_textstyle_items,
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
    );
  }

  void _callUnitList(dynamic parent) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => GroupCategoryUnitList(parent)));
  }
}
