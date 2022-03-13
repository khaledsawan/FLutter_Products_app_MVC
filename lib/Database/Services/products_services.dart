import 'dart:convert';
import 'package:flutter/services.dart'as rootBundle;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test1/Database/model/product.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';

////////////get all products//////////

class Products_Services {
  static var baseuri = "http://192.168.43.241:8000/api";

  static Future<List<Product>> Get_Products() async {
    return await http.get(Uri.parse("$baseuri/products"), headers: {
      "Authorization": "Bearer ${AuthController.token}"
    }).then((response) {
      print(response.body);
      ///////////
      if (response.statusCode == 200) {
        List<Product> values = new List<Product>.from(
            json.decode(response.body).map((data) => Product.fromJson(data)));
        print(values);
        ///////////////////demo data ///////////////////
        return values ;
      } else {
        throw Exception('Failed to load products');
      }
    });
  }
////////////get my  products//////////Getmyproducts

  static Future<List<Product>> Getmyproducts() async {
    var storage = FlutterSecureStorage();
    var author_id = await storage.read(key: "id");
    print(author_id);
    print('///////////////////');
    return await http.get(Uri.parse("$baseuri/$author_id"), headers: {
      "Authorization": "Bearer ${AuthController.token}"
    }).then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        List<Product> values = new List<Product>.from(
            json.decode(response.body).map((data) => Product.fromJson(data)));
        print(values);
        return values;
      } else {
        throw Exception('Failed to load my products');
      }
    });
  }

////////////create product//////////
//   static Future<ProductsModel> CreateProduct({
//     required name,
//     required email,
//     required category,
//     required image,
//     required price,
//     required exp_date,
//     required quantity,
//     required phone_number,
//     required common_info,
//   }) async {
//     final response =
//         await http.post(Uri.parse("$baseuri/create_pruduct"), body: {
//       "name": name,
//       "price": price,
//       "image": image,
//       "category": category,
//       "email": email,
//       "exp_date": exp_date,
//       "quantity": quantity,
//       "phone_number": phone_number,
//       "common_info": common_info,
//     });
//
//     if (response.statusCode == 201) {
//       final String responseString = response.body;
//
//       return productsModelFromJson(responseString);
//     } else {
//       throw Exception('create product not work ');
//     }
//   }
////////////Delete product//////////

  static Future<void> DeleteProduct({required id}) async {
    final http.Response response = await http.delete(
      Uri.parse("$baseuri/delete-product/{$id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      GetSnackBar(
        title: '',
        message: 'Item has been deleted',
      );
    } else {
      // If the server did not return a "200 OK response",
      // then throw an exception.
      throw Exception('Failed to delete product.');
    }
  }
////////////like product//////////

  static Future<void> LikeProduct(
      {required id, required number_of_replies}) async {
    final http.Response response = await http.post(
      Uri.parse("$baseuri"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": id,
        "number_of_replies": number_of_replies,
      }),
    );

    if (response.statusCode == 200) {
      GetSnackBar(
        title: '',
        message: 'like is work dont forget to delete',
      );
    } else {
      throw Exception('Failed to like product.');
    }
  }

  static Future<void> ViewProduct({required id}) async {
    final http.Response response = await http.post(
      Uri.parse("$baseuri"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": id,
      }),
    );

    if (response.statusCode == 200) {
      GetSnackBar(
        title: '',
        message: 'view is work dont forget to delete',
      );
    } else {
      throw Exception('Failed to view product.');
    }
  }

  static Future<void> UpDateProduct({
    required id,
    required name,
    required phone_number,
    required quantity,
    required price,
  }) async {
    final http.Response response = await http.post(
      Uri.parse("$baseuri/update-product/{$id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "phone_number": phone_number,
        "price": price,
        "quantity": quantity,
        "name": name,
      }),
    );

    if (response.statusCode == 200) {
      GetSnackBar(
        title: '',
        message: 'update is work dont forget to delete',
      );
    } else {
      throw Exception('Failed to update product.');
    }
  }

  /////////////////Search products/////////////////
  static Future<List<Product>> SearchProduct(
      {required search, required name}) async {
    var response = await http.get(Uri.parse("baseuri/$search/$name"));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> Products = body
          .map(
            (dynamic item) => Product.fromJson(item),
          )
          .toList();
      return Products;
    } else {
      throw Exception('Failed to load search');
    }
  }
  static Future<List<Product>> ReadJsonData() async {

    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return await list.map((e) => Product.fromJson(e)).toList();
  }
}
////////////////Read demo data/////////////////////
