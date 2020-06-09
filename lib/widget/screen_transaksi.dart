import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:farmapp/controller/transaksi_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';

class ScreenTransaksi extends StatefulWidget {
  @override
  _ScreenTransaksiState createState() => _ScreenTransaksiState();
}

class _ScreenTransaksiState extends State<ScreenTransaksi> {
  TransaksiController controller = TransaksiController();

  void gotoPage(BuildContext context, String s) {
    if (s == 'Inspeksi Harian') {
      Navigator.pushNamed(context, '/inspeksi-harian');
    }
//    } else if (s == 'Pemberian Pakan') {
//      Navigator.pushNamed(context, '/pemberian-pakan');
//    } else if (s == 'Mutasi') {
//      Navigator.pushNamed(context, '/mutasi');
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: ListTile(
            leading: Hero(
              tag: 'icon_transaksi',
              child: Icon(
                icon_transaksi,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Transaksi',
              style: appbar_textstyle,
            ),
          ),
          backgroundColor: const Color(color_primary_dark),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: 'Kembali ke halaman utama',
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    child: Container(
                      child: Material(
                        color: const Color(color_primary_light),
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {
                            gotoPage(context, 'Inspeksi Harian');
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: ListTile(
                                leading: Hero(
                                    tag: 'icon_inspeksi_harian',
                                    child: Icon(
                                      icon_inspeksi_harian,
                                      size: screenmaster_button_icon_size,
                                    )),
                                title: Text(
                                  'Inspeksi Harian',
                                  style: screenmaster_button_textstyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            offset: Offset(0, 10),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    child: Container(
                      child: Material(
                        color: const Color(color_primary_light),
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {
                            gotoPage(context, 'Pemberian Pakan');
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: ListTile(
                                leading: Hero(
                                    tag: 'icon_pemberian_pakan',
                                    child: Icon(
                                      icon_pemberian_pakan,
                                      size: screenmaster_button_icon_size,
                                    )),
                                title: Text(
                                  'Pemberian Pakan',
                                  style: screenmaster_button_textstyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            offset: Offset(0, 10),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    child: Container(
                      child: Material(
                        color: const Color(color_primary_light),
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {
                            gotoPage(context, 'Mutasi');
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: ListTile(
                                leading: Hero(
                                  tag: 'icon_mutasi',
                                  child: Icon(
                                    icon_mutasi,
                                    size: screenmaster_button_icon_size,
                                  ),
                                ),
                                title: Text(
                                  'Mutasi',
                                  style: screenmaster_button_textstyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            offset: Offset(0, 10),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
//        body: controller.getBody(),
    );
  }
}
