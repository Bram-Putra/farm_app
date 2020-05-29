import 'package:farmapp/controller/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:farmapp/podo/drawer_choice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  MainController mainController = MainController();

  void _setSelectedDrawer(DrawerChoice dc) {
    setState(() {
      mainController.setSelectedDrawerChoice(dc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF455A64),
                      border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFFBDBDBD),
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(mainController.choices[0].icon, color: const Color(0xFFFFFFFF),),
                      title: Text(mainController.choices[0].title, style: TextStyle(color: const Color(0xFFFFFFFF)),),
                      onTap: (){
                        _setSelectedDrawer(mainController.choices[0]);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF455A64),
                      border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFFBDBDBD),
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(mainController.choices[1].icon, color: const Color(0xFFFFFFFF),),
                      title: Text(mainController.choices[1].title, style: TextStyle(color: const Color(0xFFFFFFFF)),),
                      onTap: (){
                        _setSelectedDrawer(mainController.choices[1]);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF455A64),
                      border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFFBDBDBD),
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(mainController.choices[2].icon, color: const Color(0xFFFFFFFF),),
                      title: Text(mainController.choices[2].title, style: TextStyle(color: const Color(0xFFFFFFFF)),),
                      onTap: (){
                        _setSelectedDrawer(mainController.choices[2]);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF455A64),
                      border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFFBDBDBD),
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(mainController.choices[3].icon, color: const Color(0xFFFFFFFF),),
                      title: Text(mainController.choices[3].title, style: TextStyle(color: const Color(0xFFFFFFFF)),),
                      onTap: (){
                        _setSelectedDrawer(mainController.choices[3]);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF455A64),
                      border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFFBDBDBD),
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(mainController.choices[4].icon, color: const Color(0xFFFFFFFF),),
                      title: Text(mainController.choices[4].title, style: TextStyle(color: const Color(0xFFFFFFFF)),),
                      onTap: (){
                        _setSelectedDrawer(mainController.choices[4]);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: const Color(0xFF455A64),
              title: const Text('Farm House'),
            ),
            body: mainController.getSelectedBody(),
          ),
        ),
      ),
    );
  }
}