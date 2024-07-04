import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class Services {
  static var dmainName = 'http://192.168.164.51:8000/api/';
  static bool mybool = false;
  static var token = '';
 static late var info;

  static Future<http.Response> login(String email, String pass) async {
    var response = await http.post(
      Uri.parse('${dmainName}user-login'),
      body: <String, String>{
        'email': email,
        'password': pass,
      },
    );
    print(response.statusCode);
    print("response is ${response.body}");
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      print(map);
      print(map['data']['token']);
      token = map['data']['token'];
      return response;
    } else {
      throw Exception('can not load');
    }
  }

  static Future<http.Response> expertLogin(String email, String pass) async {
    var response = await http.post(
      Uri.parse('${dmainName}expert-login'),
      body: <String, String>{
        'email': email,
        'password': pass,
      },
    );
    print(response.statusCode);
    print("response is ${response.body}");
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      print(map);
      print(map['data']['token']);
      token = map['data']['token'];
      return response;
    } else {
      throw Exception('can not load');
    }
  }
}
