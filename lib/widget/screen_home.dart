import 'package:farmapp/widget/materi_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/scheduler.dart';

class ScreenHome extends StatelessWidget {
  void gotoPage(BuildContext context, String s) {
    if (s == 'Master') {
      Navigator.pushNamed(context, '/master');
    } else if (s == 'Transaksi') {
      Navigator.pushNamed(context, '/transaksi');
    } else if (s == 'Laporan') {
      Navigator.pushNamed(context, '/laporan');
    } else if (s == 'Dashboard') {
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO: timeDilation (delete if needed)
    timeDilation = 3.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Farm App'),
        backgroundColor: const Color(color_primary_dark),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 24.0, 12.0, 12.0),
                        child: Container(
                          child: Material(
                            color: const Color(color_primary_light),
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () {
                                gotoPage(context, 'Master');
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Hero(
                                    tag: 'icon_master',
                                    child: Icon(
                                      icon_master,
                                      size: screenhome_button_icon_size,
                                    ),
                                  ),
                                  Text(
                                    'Master',
                                    style: screenhome_button_textstyle,
                                  ),
                                ],
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
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 24.0, 24.0, 12.0),
                        child: Container(
                          child: Material(
                            color: const Color(color_primary_light),
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () {
                                gotoPage(context, 'Transaksi');
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Hero(
                                    tag: 'icon_transaksi',
                                    child: Icon(
                                      icon_transaksi,
                                      size: screenhome_button_icon_size,
                                    ),
                                  ),
                                  Text(
                                    'Transaksi',
                                    style: screenhome_button_textstyle,
                                  ),
                                ],
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
            Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 12.0, 12.0, 24.0),
                        child: Container(
                          child: Material(
                            color: const Color(color_primary_light),
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () {
//                                gotoPage(context, 'Laporan');
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Hero(
                                    tag: 'icon_laporan',
                                    child: Icon(
                                      icon_laporan,
                                      size: screenhome_button_icon_size,
                                    ),
                                  ),
                                  Text(
                                    'Laporan',
                                    style: screenhome_button_textstyle,
                                  ),
                                ],
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
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 24.0, 24.0),
                        child: Container(
                          child: Material(
                            color: const Color(color_primary_light),
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () {
                                gotoPage(context, 'Dashboard');
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Hero(
                                    tag: 'icon_dashboard',
                                    child: Icon(
                                      icon_dashboard,
                                      size: screenhome_button_icon_size,
                                    ),
                                  ),
                                  Text(
                                    'Dashboard',
                                    style: screenhome_button_textstyle,
                                  ),
                                ],
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
            )
          ],
        ),
      ),
    );
  }
}
