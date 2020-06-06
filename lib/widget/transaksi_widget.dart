import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:farmapp/controller/transaksi_controller.dart';
import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  TransaksiController controller = TransaksiController();

  void _setSelectedIndex(int i) {
    setState(() {
      controller.setBodyNumber(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.getBody(),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: const Color(0xFF455A64),
          items: [
            TabItem(icon: Icons.access_alarm, title: 'Daily Check')
          ],
          initialActiveIndex: controller.getBodyNumber(),
          onTap: (int i) {
            _setSelectedIndex(i);
          },
        )
    );
  }
}
