import 'package:flutter/material.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/scheduler.dart';

class ScreenMaster extends StatelessWidget {
  void gotoPage(BuildContext context, String s) {
    if (s == 'Kandang') {
      Navigator.pushNamed(context, '/kandang');
    } else if (s == 'Materi') {
      Navigator.pushNamed(context, '/materi');
    } else if (s == 'Materi Type') {
      Navigator.pushNamed(context, '/materi-type');
    } else if (s == 'Livestock') {
      Navigator.pushNamed(context, '/livestock');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ListTile(
          leading: Hero(
            tag: 'icon_master',
            child: Icon(
              icon_master,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Master',
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
                          gotoPage(context, 'Kandang');
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Hero(
                                  tag: 'icon_kandang',
                                  child: Icon(
                                    icon_kandang,
                                    size: screenmaster_button_icon_size,
                                  )),
                              title: Text(
                                'Kandang',
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
                          gotoPage(context, 'Materi');
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Hero(
                                  tag: 'icon_materi',
                                  child: Icon(
                                    icon_materi,
                                    size: screenmaster_button_icon_size,
                                  )),
                              title: Text(
                                'Material',
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
                          gotoPage(context, 'Materi Type');
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Hero(
                                tag: 'icon_materi_type',
                                child: Icon(
                                  icon_materi_type,
                                  size: screenmaster_button_icon_size,
                                ),
                              ),
                              title: Text(
                                'Material Type',
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
                          gotoPage(context, 'Livestock');
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Hero(
                                tag: 'icon_livestock',
                                child: Icon(
                                  icon_livestock,
                                  size: screenmaster_button_icon_size,
                                ),
                              ),
                              title: Text(
                                'Livestock',
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
                          gotoPage(context, 'Group Category');
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Icon(
                                icon_group_category,
                                size: screenmaster_button_icon_size,
                              ),
                              title: Text(
                                'Group Category',
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
    );
  }
}

//onTap: () {
//gotoPage(context, 'Kandang');
//},
