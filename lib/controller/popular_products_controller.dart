import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/model/product_model.dart';
import '../service/repository/popular_product_repo.dart';


class PopularProductController extends GetxController {
  late PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  late List<dynamic> _productList = [];
  List<dynamic> get popularProductList => _productList;



  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

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








}
