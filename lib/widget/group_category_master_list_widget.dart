import 'package:farmapp/widget/group_category_wilayah_list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:farmapp/podo/barn_constant.dart';

class GroupCategoryMasterList extends StatefulWidget {
  @override
  _GroupCategoryMasterListState createState() =>
      _GroupCategoryMasterListState();
}

class _GroupCategoryMasterListState extends State<GroupCategoryMasterList> {
  Future<http.Response> _futureResponse;

  @override
  void initState() {
    super.initState();
    _futureResponse = http.get(url_path + 'v1/groupCategories?parentId=1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Hero(
            tag: 'icon_group_category',
            child: Icon(
              icon_group_category,
              color: Colors.white,
            ),
          ),
          title: Hero(
            tag: 'text_group_category',
            child: Text(
              'Group Category',
              style: textstyle_appbar,
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
      body: FutureBuilder(
        future: _futureResponse,
        builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
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
            return GroupCategoryWilayahList(listGC);
          }
        },
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
