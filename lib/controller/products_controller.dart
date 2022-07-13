import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/model/product_model.dart';
import '../service/repository/product_repo.dart';

class ProductController extends GetxController {
  late ProductRepo popularProductRepo;

  ProductController({required this.popularProductRepo});

  late List<dynamic> _productList = [];
  List<dynamic> get ProductList => _productList;
  late List<dynamic> _myproductList = [];
  List<dynamic> get MyProductList => _myproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.GetProductList();
    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products);
      print(_productList);
      _isLoaded = true;
      update();
    } else {
      print("No products");
    }
  }

  Future<void> getmyproduct() async {
    Response response = await popularProductRepo.GetProductList();
    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products);
      print(_productList);
      _isLoaded = true;
      update();
    } else {
      print("No products");
    }
  }

  Future<void> addproduct() async {
    Response response = await popularProductRepo.GetProductList();
    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products);
      print(_productList);
      _isLoaded = true;
      update();
    } else {
      print("No products");
    }
  }

  Future<void> updateproduct() async {
    Response response = await popularProductRepo.GetProductList();
    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products);
      print(_productList);
      _isLoaded = true;
      update();
    } else {
      print("No products");
    }
  }

  Future<void> deletteproduct() async {
    Response response = await popularProductRepo.GetProductList();
    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products);
      print(_productList);
      _isLoaded = true;
      update();
    } else {
      print("No products");
    }
  }
}
