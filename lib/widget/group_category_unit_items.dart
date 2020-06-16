import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';

class GroupCategoryUnitItems extends StatefulWidget {
  final int gcId;
  final String gcName;

  GroupCategoryUnitItems(this.gcId, this.gcName);

  @override
  _GroupCategoryUnitItemsState createState() => _GroupCategoryUnitItemsState();
}

class _GroupCategoryUnitItemsState extends State<GroupCategoryUnitItems> {
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
    return ExpansionTile(
      key: _key,
      title: Text(widget.gcName),
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
                    ListTile(
                      dense: true,
                      title: Text(element['groupCategoryName']),
                      subtitle: Text(element['groupCategoryId'].toString()),
                    ),
                  );
                },
              );
              return Column(children: reasonList);
            }
          },
        )
      ],
    );
  }
}
