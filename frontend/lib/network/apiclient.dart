import 'dart:convert';

import 'package:frontend/widgets/sanckbar.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final baseUrl = "http://192.168.1.43:8000/api/v1/";


///  -------------   Auth Api Client    -------------
  Future authData(endpoint, body) async {
    try {
      final responsed = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (responsed.statusCode == 201) {
        return jsonDecode(responsed.body);
      } else {
        snackBar("Auth Failed", "Invalid Credentials");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

///  -------------   Post Api Client    -------------
  Future<Map<String, dynamic>> postData(endpoint, body, token) async {
    try {
      final responsed = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: {
          "Content-Type": "application/json",
          'Authorization': "$token",
        },
        body: jsonEncode(body),
      );

      if (responsed.statusCode == 200) {
        return jsonDecode(responsed.body);
      } else {
        throw Exception("Login failed: ${responsed.body}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


///  -------------   Get Api Client    -------------
  Future<Map<String, dynamic>> getData(endpoint, body, token, id) async {
    try {
      final responsed = await http.get(
        Uri.parse(baseUrl + endpoint + id),
        headers: {
          "Content-Type": "application/json",
          'Authorization': "$token",
        },
      );

      if (responsed.statusCode == 200) {
        return jsonDecode(responsed.body);
      } else {
        throw Exception("Login failed: ${responsed.body}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
