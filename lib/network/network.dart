import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // static void setToken(String token) {
  //   _dio.options.headers['Authorization'] = 'Bearer $token';
  // } setToken method sets the Authorization header for all requests.

  static Future<dynamic> api({
    required String endPoint,
    Map<String, dynamic>? data,
    required BuildContext context,
  }) async {
    try {
      var res = await http.post(
          Uri.parse('https://api.openai.com/v1/chat/completions'),
          headers: {},
          body: {});

      print(res.body);
    } catch (error) {
      print(error.toString());
    }
  }
}
