import 'package:flutter/material.dart';
import 'package:farmapp/podo/barn_constant.dart';

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
    } else if (s == 'Group Category') {
      Navigator.pushNamed(context, '/group-category');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        automaticallyImplyLeading: false,
        title: ListTile(
          leading: Hero(
            tag: 'icon_master',
            child: Icon(
              icon_master,
              color: color_text_white,
            ),
          ),
          title: Hero(
            tag: 'text_master',
            child: Text(
              'Master',
              style: textstyle_appbar,
            ),
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
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'body_master',
              child: Container(
                color: color_primary_light,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  //Kandang
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: 'body_kandang',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color_screen_button_white,
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
                              color: color_screen_button_white,
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
                                          size: size_screenmaster_button_icon,
                                          color: color_text_secondary,
                                        ),
                                      ),
                                      title: Hero(
                                        tag: 'text_kandang',
                                        child: Text(
                                          'Kandang',
                                          style: textstyle_screenmaster_button,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //Material
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: 'body_materi',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color_screen_button_white,
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
                              color: color_screen_button_white,
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
                                            size: size_screenmaster_button_icon,
                                            color: color_text_secondary,
                                          )),
                                      title: Hero(
                                        tag: 'text_materi',
                                        child: Text(
                                          'Material',
                                          style: textstyle_screenmaster_button,
                                        ),
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
                        ],
                      ),
                    ),
                  ),
                  //Material Type
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: 'body_materi_type',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color_screen_button_white,
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
                              color: color_screen_button_white,
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
                                          size: size_screenmaster_button_icon,
                                          color: color_text_secondary,
                                        ),
                                      ),
                                      title: Hero(
                                        tag: 'text_materi_type',
                                        child: Text(
                                          'Material Type',
                                          style: textstyle_screenmaster_button,
                                        ),
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
                        ],
                      ),
                    ),
                  ),
                  //Livestock
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: 'body_livestock',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color_screen_button_white,
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
                              color: color_screen_button_white,
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
                                          size: size_screenmaster_button_icon,
                                          color: color_text_secondary,
                                        ),
                                      ),
                                      title: Hero(
                                        tag: 'text_livestock_type',
                                        child: Text(
                                          'Livestock Type',
                                          style: textstyle_screenmaster_button,
                                        ),
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
                        ],
                      ),
                    ),
                  ),
                  //Group Category
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: Container(
                        child: Material(
                          color: color_screen_button_white,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () {
                              gotoPage(context, 'Group Category');
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: ListTile(
                                  leading: Hero(
                                    tag: 'icon_group_category',
                                    child: Icon(
                                      icon_group_category,
                                      size: size_screenmaster_button_icon,
                                      color: color_text_secondary,
                                    ),
                                  ),
                                  title: Hero(
                                    tag: 'text_group_category',
                                    child: Text(
                                      'Group Category',
                                      style: textstyle_screenmaster_button,
                                    ),
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
            )
          ],
        ),
      ),
    );
  }
}

//onTap: () {
//gotoPage(context, 'Kandang');
//},
