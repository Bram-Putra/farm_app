import 'dart:io';
import 'package:farmapp/controller/login_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = false;
  LoginController _loginController = LoginController();
  TextEditingController tcUserName = TextEditingController();
  TextEditingController tcPassword = TextEditingController();

  void _login() async {
    _isLogin = true;
    setState(() {});
    Login login =
        Login(userName: tcUserName.text, userPassword: tcPassword.text);
    await _loginController.login(login);
    _loadToken();
  }

  void _loadToken() {
    _isLogin = false;
    setState(() {});
    Future<String> token = _loginController.getToken();
    token.then((value) => {
          if (value == null)
            {
              print('if null'),
              print(value),
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Informasi'),
                  content:
                      Text('Harap gunakan User Name dan Password yang tepat'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Ok')),
                  ],
                ),
              ),
            }
          else
            {
              tcUserName.text = '',
              tcPassword.text = '',
              Navigator.of(context).popUntil(ModalRoute.withName('/'))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_primary_dark,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'a Farm App',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'that manages all the cages',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                  color: color_divider,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Divider(
                  color: color_divider,
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'User Name', border: InputBorder.none),
                  controller: tcUserName,
                ),
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password', border: InputBorder.none),
                    obscureText: true,
                    controller: tcPassword,
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: _isLogin
                  ? ButtonTheme(
                      height: height_button_login,
                      buttonColor: color_button_login_disabled,
                      child: RaisedButton(
                        child: Text(
                          'Login',
                          style: textstyle_button_login,
                        ),
                        onPressed: () {
                          null;
                        },
                      ),
                    )
                  : ButtonTheme(
                      height: height_button_login,
                      buttonColor: color_button_login,
                      child: RaisedButton(
                        child: Text(
                          'Login',
                          style: textstyle_button_login,
                        ),
                        onPressed: () {
                          _login();
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    bool confirmed = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit'),
        content: Text('Keluar dari aplikasi?'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Iya')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Tidak')),
        ],
      ),
    ).then((value) {
      confirmed = value;
      if (confirmed) {
        exit(0);
      }
    });
    return true;
  }
}
