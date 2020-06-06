import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListTile(
          leading: Icon(icon_transaksi),
          title: Text('Transaksi'),
        ),
      ),
    );
  }
}
