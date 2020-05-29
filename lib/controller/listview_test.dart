import 'package:farmapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ListViewTest {
  List<String> daftar = [
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States of America',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];

  void _showSnackBar(String s, BuildContext contextX) {
    final snackBar = SnackBar(content: Text('You\'ve chosen ' + s));
    Scaffold.of(contextX).showSnackBar(snackBar);
  }

  void _deleteItem(int i, BuildContext contextX, State<MyApp> st) {
    daftar.removeAt(i);
    final snackBar = SnackBar(content: Text('You\'ve deleted item number $i'));
    Scaffold.of(contextX).showSnackBar(snackBar);
    st.setState(() {});
  }

  ListView getFullList() {
    return ListView.builder(
        itemCount: daftar.length,
        itemBuilder: (context, index) {
          return Container(
            color: const Color(0xFFCFD8DC),
            child: ListTile(
              title: Text('Name: ' + daftar[index]),
              subtitle: Text('Number: $index'),
            ),
          );
        },
    );
  }

//  ListView getList(BuildContext context, State<MyApp> st) {
//    return ListView.builder(
//      itemCount: daftar.length,
//      itemBuilder: (context, index) {
//        return Slidable(
//          actionPane: SlidableDrawerActionPane(),
//          child: Container(
//            color: const Color(0xFFCFD8DC),
//            child: ListTile(
//              title: Text('Name: '+daftar[index]),
//              subtitle: Text('Number: $index'),
//            ),
//          ),
//          secondaryActions: <Widget>[
//            IconSlideAction(
//              caption: 'More',
//              color: Colors.black45,
//              icon: Icons.more_horiz,
//              onTap: () => _showSnackBar('More', context),
//            ),
//            IconSlideAction(
//              caption: 'Delete',
//              color: Colors.red,
//              icon: Icons.delete,
//              onTap: () => _deleteItem(index, context, st),
//            ),
//          ],
//        );
//      },
//    );
//  }
}
