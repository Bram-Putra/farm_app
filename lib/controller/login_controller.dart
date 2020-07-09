import 'package:farmapp/podo/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'dart:io';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:http/http.dart' as http;

class LoginController {
  final _secureStorage = new FlutterSecureStorage();

  void _setToken(String tokenX) async {
    await _secureStorage.write(key: "token", value: tokenX);
  }

  Future<String> getToken() async {
    String token = await _secureStorage.read(key: "token");
    return token;
  }

  void login(Login login) async {
    var url = url_path + 'v1/security/login';
    var json = jsonEncode(login.toJson());
    var res = await http.post(url, body: json, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    int code = res.statusCode;
    if (code == 200) {
      print('res.body:');
      print(res.body);
      String s = res.body;
      _setToken(s);
      Future<String> token = getToken();
      token.then((value) => {
        print('token:'),
        print(value),
        _selectMenu(value),
      });
    } else {
      print("Gagal Login");
    }
  }

  _selectMenu(String token) async {
    var url = url_path + 'v1/users/role?userName=' + 'user';
    var res = await http.get(url);
    int code = res.statusCode;
    if (code == 200) {
      print('menu: ');
      print(res.body);
    }
    else {
      print('gagal mendapatkan menu');
    }
  }

  void logout() async {
    await _secureStorage.delete(key: "token");
    print('Logout');
    exit(0);
  }
}