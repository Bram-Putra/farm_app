import 'package:flutter/material.dart';

class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListTile(
          leading: Icon(Icons.library_books),
          title: Text('Laporan'),
        ),
      ),
    );
  }
}
