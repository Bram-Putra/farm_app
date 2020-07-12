import 'package:farmapp/podo/login.dart';
import 'package:farmapp/podo/role.dart';
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

  void _setUserName(String userName) async {
    await _secureStorage.write(key: "userName", value: userName);
  }

  void login(Login login) async {
    var url = url_path + 'v1/security/login';
    var json = jsonEncode(login.toJson());
    var res = await http.post(url, body: json, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    int code = res.statusCode;
    if (code == 200) {
      _setUserName(login.userName);
      String s = res.body;
      _setToken(s);
      Future<String> token = getToken();
      token.then((value) => {
        getRole(),
      });
    } else {
      print("Gagal Login");
    }
  }

  Future<Role> getRole() async {
    var userName = await _secureStorage.read(key: "userName");
    var url = url_path + 'v1/users/role?userName=' + userName;
    var res = await http.get(url);
    int code = res.statusCode;
    if (code == 200) {
      var decodedJson = jsonDecode(res.body);
      Role r = Role.fromJson(decodedJson);
      return r;
    }
    else {
      print('gagal mendapatkan menu');
    }
  }

  void logout() async {
    await _secureStorage.delete(key: "token");
    await _secureStorage.delete(key: "userName");
    Future<String> s = _secureStorage.read(key: "token");
    s.then((value) => {
      if(value == null) {
        exit(0)
      }
    });
  }
}