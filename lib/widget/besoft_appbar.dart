import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';

class BesoftAppbar extends StatelessWidget {
  const BesoftAppbar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
      backgroundColor: const Color(color_primary_dark),
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Go back to Home screen',
            onPressed: () {
              Navigator.pushNamed(context, '/');
            }),
      ],
    );
  }
}
