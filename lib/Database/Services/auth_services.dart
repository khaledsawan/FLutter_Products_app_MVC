import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test1/Database/model/user_model.dart';

class AuthService {
  static String baseApi = "http://192.168.43.241:8000/api";
  static var client = http.Client();

  static Future register(
      {required name,
      required email,
      required password,
      required phone_no}) async {
    return await http
        .post(
      Uri.parse("$baseApi/register"),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(<String, String>{
        "name": name,
        "email": email,
        "password": password,
        "phone_no": phone_no,
        "password_confirmation": password
      }),
    )
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var StringObject = response.body;
        var user = userFromJson(StringObject);
        return user;
      }
    });
  }

  static login({required email, required password}) async {
    var response = await client.post(
      Uri.parse("$baseApi/login"),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(<String, String>{"email": email, "password": password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var StringObject = response.body;
      var user = userFromJson(StringObject);
      return user;
    }
  }

  static logout() async {
    await client.post(Uri.parse("$baseApi/logout"));
  }
}
