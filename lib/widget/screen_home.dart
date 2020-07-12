import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:farmapp/controller/login_controller.dart';
import 'package:farmapp/podo/role.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ScreenHome extends StatefulWidget {
  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  LoginController _loginController = LoginController();
  final _secureStorage = new FlutterSecureStorage();
  bool _isLoggingOut = false;

  List<String> _listModule = [];
  Set<String> _setModule;
  bool _master = false;
  bool _transaction = false;
  bool _report = false;
  bool _dashboard = false;

  void gotoPage(BuildContext context, String s) {
    if (s == 'Master') {
      if (_master) {
        Navigator.pushNamed(context, '/master');
      }
    } else if (s == 'Transaksi') {
      if (_transaction) {
        Navigator.pushNamed(context, '/transaksi');
      }
    } else if (s == 'Laporan') {
      if (_report) {
        Navigator.pushNamed(context, '/laporan');
      }
    } else if (s == 'Dashboard') {
      if (_dashboard) {
        Navigator.pushNamed(context, '/dashboard');
      }
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Exit'),
            content: new Text('Keluar dari aplikasi?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Iya'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Tidak'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Future<bool> _onWillExit() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit'),
            content: Text('Keluar dari aplikasi?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Iya'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Tidak'),
              ),
            ],
          ),
        ).then((value) {
          if (value) {
            setState(() {
              _isLoggingOut = true;
            });
            _loginController.logout();
          }
          return value;
        })) ??
        false;
  }

  Future<void> _exit() async {
    bool confirmed = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Logout dari aplikasi?'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Iya')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Tidak')),
        ],
      ),
    ).then(
      (value) {
        confirmed = value;
        if (confirmed) {
          setState(() {
            _isLoggingOut = true;
          });
          _loginController.logout();
        }
      },
    );
  }

  @override
  build(BuildContext context) {
    //TODO: timeDilation (delete if needed)
    timeDilation = 2.0;
    return FutureBuilder<String>(
      future: _getModules(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: color_primary_dark,
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          if (snapshot.hasError) {
            return WillPopScope(
              onWillPop: _onWillExit,
              child: Scaffold(
                backgroundColor: color_primary_dark,
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text('Welcome to Farm App',
                              style: textstyle_version_title),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 6,
                        child: Center(
                          child: Icon(
                            icon_app,
                            size: size_icon_app,
                            color: color_primary_medium,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'v 0.1.18',
                            style: textstyle_version,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: color_primary_medium,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                40.0, 10.0, 40.0, 40.0),
                            child: ButtonTheme(
                              buttonColor: color_primary_light,
                              minWidth: double.infinity,
                              height: double.infinity,
                              child: RaisedButton(
                                child: Text(
                                  'Continue',
                                  style: textstyle_agree_button,
                                ),
                                onPressed: () {
                                  _getRole();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return WillPopScope(
              onWillPop: _onWillPop,
              child: _isLoggingOut
                  ? Scaffold(
                      backgroundColor: Colors.white,
                      body: SafeArea(
                        child: Center(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text('Logging out'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        title: Text('Farm App'),
                        backgroundColor: color_primary_dark,
                        actions: <Widget>[
                          IconButton(
                              icon: const Icon(Icons.exit_to_app),
                              onPressed: () {
                                _exit();
                              })
                        ],
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
                                        padding: const EdgeInsets.fromLTRB(
                                            24.0, 24.0, 12.0, 12.0),
                                        child: Stack(
                                          children: <Widget>[
                                            Hero(
                                              tag: 'body_master',
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: color_primary_light,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(.2),
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: InkWell(
                                                  onTap: () {
                                                    gotoPage(context, 'Master');
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Center(
                                                        child: Hero(
                                                          tag: 'icon_master',
                                                          child: Icon(
                                                              icon_master,
                                                              size:
                                                                  size_screenhome_button_icon,
                                                              color: _master
                                                                  ? color_text_primary
                                                                  : color_text_white),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Hero(
                                                          tag: 'text_master',
                                                          child: Text('Master',
                                                              style: _master
                                                                  ? textstyle_screenhome_button
                                                                  : textstyle_screenhome_button_disabled),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 24.0, 24.0, 12.0),
                                        child: Stack(
                                          children: <Widget>[
                                            Hero(
                                              tag: 'body_transaksi',
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: color_primary_light,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(.2),
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: InkWell(
                                                  onTap: () {
                                                    gotoPage(
                                                        context, 'Transaksi');
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Center(
                                                        child: Hero(
                                                          tag: 'icon_transaksi',
                                                          child: Icon(
                                                              icon_transaksi,
                                                              size:
                                                                  size_screenhome_button_icon,
                                                              color: _transaction
                                                                  ? color_text_primary
                                                                  : color_text_white),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Hero(
                                                          tag: 'text_transaksi',
                                                          child: Text(
                                                              'Transaksi',
                                                              style: _transaction
                                                                  ? textstyle_screenhome_button
                                                                  : textstyle_screenhome_button_disabled),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            24.0, 12.0, 12.0, 24.0),
                                        child: Stack(
                                          children: <Widget>[
                                            Hero(
                                              tag: 'body_laporan',
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: color_primary_light,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(.2),
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: InkWell(
                                                  onTap: () {
                                                    gotoPage(
                                                        context, 'Laporan');
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Center(
                                                        child: Hero(
                                                          tag: 'icon_laporan',
                                                          child: Icon(
                                                              icon_laporan,
                                                              size:
                                                                  size_screenhome_button_icon,
                                                              color: _report
                                                                  ? color_text_primary
                                                                  : color_text_white),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Hero(
                                                          tag: 'text_laporan',
                                                          child: Text('Laporan',
                                                              style: _report
                                                                  ? textstyle_screenhome_button
                                                                  : textstyle_screenhome_button_disabled),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 12.0, 24.0, 24.0),
                                        child: Stack(
                                          children: <Widget>[
                                            Hero(
                                              tag: 'body_dashboard',
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: color_primary_light,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(.2),
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: InkWell(
                                                  onTap: () {
                                                    gotoPage(
                                                        context, 'Dashboard');
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Center(
                                                        child: Hero(
                                                          tag: 'icon_dashboard',
                                                          child: Icon(
                                                              icon_dashboard,
                                                              size:
                                                                  size_screenhome_button_icon,
                                                              color: _dashboard
                                                                  ? color_text_primary
                                                                  : color_text_white),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Hero(
                                                          tag: 'text_dashboard',
                                                          child: Text(
                                                              'Dashboard',
                                                              style: _dashboard
                                                                  ? textstyle_screenhome_button
                                                                  : textstyle_screenhome_button_disabled),
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
                    ),
            );
          }
        }
      },
    );
  }

  void _getRole() async {
    await _getModules();
    setState(() {});
  }

  Future<String> _getModules() async {
    var userName = await _secureStorage.read(key: "userName");
    var url = url_path + 'v1/users/role?userName=' + userName;
    var res = await http.get(url);
    int code = res.statusCode;
    if (code == 200) {
      var decodedJson = await jsonDecode(res.body);
      Role role = Role.fromJson(decodedJson);
      _listModule.clear();
      if (role != null) {
        for (int c = 0; c < role.moduleList.length; c++) {
          _listModule.add(role.moduleList[c].module.parentName);
        }
        _setModule = Set.from(_listModule);
        for (int i = 0; i < _setModule.length; i++) {
          if (_setModule.elementAt(i) == 'Master') {
            _master = true;
          }
          if (_setModule.elementAt(i) == 'Transaction') {
            _transaction = true;
          }
          if (_setModule.elementAt(i) == 'Report') {
            _report = true;
          }
          if (_setModule.elementAt(i) == 'Dashboard') {
            _dashboard = true;
          }
        }
      }
    } else {
      print('gagal mendapatkan menu');
    }
  }
}
