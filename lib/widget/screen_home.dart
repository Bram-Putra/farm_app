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
        backgroundColor: color_primary_dark,
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
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: 'body_master',
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: color_primary_light,
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
                            Container(
                              child: Material(
                                color: color_primary_light,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  onTap: () {
                                    gotoPage(context, 'Master');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Hero(
                                          tag: 'icon_master',
                                          child: Icon(
                                            icon_master,
                                            size: size_screenhome_button_icon,
                                            color: color_text_primary,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Hero(
                                          tag: 'text_master',
                                          child: Text(
                                            'Master',
                                            style: textstyle_screenhome_button,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 24.0, 24.0, 12.0),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: 'body_transaksi',
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: color_primary_light,
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
                            Container(
                              child: Material(
                                color: color_primary_light,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  onTap: () {
                                    gotoPage(context, 'Transaksi');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Hero(
                                          tag: 'icon_transaksi',
                                          child: Icon(
                                            icon_transaksi,
                                            size: size_screenhome_button_icon,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Hero(
                                          tag: 'text_transaksi',
                                          child: Text(
                                            'Transaksi',
                                            style: textstyle_screenhome_button,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                    //Laporan
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 12.0, 12.0, 24.0),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: 'body_laporan',
                              child: Container(
                                decoration: BoxDecoration(
                                  color: color_primary_light,
                                  borderRadius: BorderRadius.circular(8),
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
                            Container(
                              child: Material(
                                color: color_primary_light,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  onTap: () {
                                gotoPage(context, 'Laporan');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Hero(
                                          tag: 'icon_laporan',
                                          child: Icon(
                                            icon_laporan,
                                            size: size_screenhome_button_icon,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Hero(
                                          tag: 'text_laporan',
                                          child: Text(
                                            'Laporan',
                                            style: textstyle_screenhome_button,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 24.0, 24.0),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: 'body_dashboard',
                              child: Container(
                                decoration: BoxDecoration(
                                  color: color_primary_light,
                                  borderRadius: BorderRadius.circular(8),
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
                            Container(
                              child: Material(
                                color: color_primary_light,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  onTap: () {
                                    gotoPage(context, 'Dashboard');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Hero(
                                          tag: 'icon_dashboard',
                                          child: Icon(
                                            icon_dashboard,
                                            size: size_screenhome_button_icon,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Hero(
                                          tag: 'text_dashboard',
                                          child: Text(
                                            'Dashboard',
                                            style: textstyle_screenhome_button,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
