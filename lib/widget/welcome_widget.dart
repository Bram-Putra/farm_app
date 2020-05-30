import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFD8DC),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: const Color(0xFFCFD8DC),
                backgroundImage: AssetImage('images/app_icon_2.png'),
              ),
            ),
            Center(
              child: Text(
                'Fun starts at a Farm',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 30.0,
                  color: const Color(0xFF9E9E9E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'v 0.0.2',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                  color: const Color(0xFFBDBDBD),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 120.0,),
            Center(
              child: Text(
                'by',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 10.0,
                  color: const Color(0xFFBDBDBD),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            Center(
              child: Text(
                'beSoft',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 14.0,
                  color: const Color(0xFF9E9E9E),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
