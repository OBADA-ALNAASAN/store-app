import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('status code:${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url, @required dynamic body, String? token}) async {
    {
      Map<String, String> headers = {};

      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      http.Response response =
          await http.post(Uri.parse(url), body: body, headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('status code:${response.statusCode}');
      }
    }
  }

  Future<dynamic> put(
      {required String url, @required dynamic body, String? token}) async {
    {
      Map<String, String> headers = {};
      headers.addAll({
        'Content-Type': 'application/x-www-form-urlencoded',
      });
      print("url=$url bodu=$body token=$token ");

      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      http.Response response =
          await http.post(Uri.parse(url), body: body, headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('status code:${response.statusCode}');
      }
    }
  }
}
