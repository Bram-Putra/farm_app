import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';

class BesoftAppbar extends StatelessWidget {
  const BesoftAppbar({Key key, this.title, this.iconTag, this.icon})
      : super(key: key);

  final String title;
  final String iconTag;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
//        automaticallyImplyLeading: false,
      title: ListTile(
        leading: Hero(
          tag: iconTag,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: textstyle_appbar,
        ),
      ),
      backgroundColor: color_primary_dark,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Kembali ke halaman utama',
          onPressed: () {
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
          },
        ),
      ],
    );
  }
}
