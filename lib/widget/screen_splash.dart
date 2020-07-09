import 'package:farmapp/controller/login_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  LoginController _loginController = LoginController();

  Future<void> _initRoute() async {
    var _token = await _loginController.getToken();
    if (_token == null) {
      Navigator.pushNamed(context, '/login');
    } else {
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
    }
  }

  @override
  void initState() {
    super.initState();
    _initRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_primary_light,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: color_primary_light
            ),
          ),
        ),
      ),
    );
  }
}
