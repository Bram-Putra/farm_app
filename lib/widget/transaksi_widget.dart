import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:farmapp/controller/transaksi_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
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
            TabItem(icon: Icons.access_alarm, title: 'Inspeksi Harian'),
            TabItem(icon: icon_materi, title: 'Material'),
            TabItem(icon: Icons.swap_vertical_circle, title: 'Mutasi')
          ],
          initialActiveIndex: controller.getBodyNumber(),
          onTap: (int i) {
            _setSelectedIndex(i);
          },
        )
    );
  }
}
