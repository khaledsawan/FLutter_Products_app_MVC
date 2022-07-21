import 'package:get/get.dart';
import 'package:test1/service/model/product_destroy.dart';
import '../service/model/index_product_modle.dart';
import '../service/model/response_model.dart';

import '../service/repository/product_repo.dart';
import '../widgets/Custom_snackpar/show_custom_snackpar_red.dart';

class ProductController extends GetxController {
  ProductRepo productRepo;
  ProductController({required this.productRepo});

  late List<Data> _productList = [];
  List<Data> get ProductList => _productList;
  late List<Data> _myproductList = [];
  List<Data> get MyProductList => _myproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getProductList() async {
    _isLoaded = true;
    Response response = await productRepo.GetProductList();
    if (response.statusCode == 200) {
      _productList = [];

      _productList.addAll(IndexProductModel.fromJson(response.body).data);

      _isLoaded = false;
      update();
    } else {
      print("No products");
    }
    _isLoaded = false;
  }

  Future<void> getMyProduct() async {
    _isLoaded = true;
    Response response = await productRepo.GetProductList();
    if (response.statusCode == 200) {
      _myproductList = [];

      _myproductList.addAll(IndexProductModel.fromJson(response.body).data);

      _isLoaded = false;
      update();
    } else {
      print("No products");
    }
    _isLoaded = false;
  }

  Future<ResponseModel> destroy_product(ProductDestroy productDestroy) async {
    _isLoaded = true;
    ResponseModel responseModel;
    Response response = await productRepo.destroy(productDestroy);
    if (response.statusCode == 200) {
      _isLoaded = false;
      responseModel = ResponseModel(massage:  response.body['message'].toString(), isSuccessful: true);
    } else {
      print(response.statusCode);
      ShowCustomSnackparRed('not done ', 'error');
      responseModel = ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    _isLoaded = false;
    update();
    return responseModel;
  }

  // Future<void> addproduct() async {
  //   Response response = await popularProductRepo.GetProductList();
  //   if (response.statusCode == 200) {
  //     _productList = [];
  //     _productList.addAll(Product.fromJson(response.body).products);
  //     print(_productList);
  //     _isLoaded = true;
  //     update();
  //   } else {
  //     print("No products");
  //   }
  // }
  //
  // Future<void> updateproduct() async {
  //   Response response = await popularProductRepo.GetProductList();
  //   if (response.statusCode == 200) {
  //     _productList = [];
  //     _productList.addAll(Product.fromJson(response.body).products);
  //     print(_productList);
  //     _isLoaded = true;
  //     update();
  //   } else {
  //     print("No products");
  //   }
  // }
  //
  // Future<void> deletteproduct() async {
  //   Response response = await popularProductRepo.GetProductList();
  //   if (response.statusCode == 200) {
  //     _productList = [];
  //     _productList.addAll(Product.fromJson(response.body).products);
  //     print(_productList);
  //     _isLoaded = true;
  //     update();
  //   } else {
  //     print("No products");
  //   }
  // }
}
