import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test1/Database/model/Category.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';

class category_Service {
  static var baseURL = "http://192.168.43.241:8000";

  static Future<List<Category>> Get_Products() async {
    return await http.get(Uri.parse("$baseURL/products"), headers: {
      "Authorization": "Bearer ${AuthController.token}"
    }).then((response) {
      print(response.body);
      ///////////
      if (response.statusCode == 200) {
        List<Category> values = new List<Category>.from(
            json.decode(response.body).map((data) => Category.fromJson(data)));
        print(values);
        return values;
      } else {
        throw Exception('Failed to load Category');
      }
    });
  }
}
