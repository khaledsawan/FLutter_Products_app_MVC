import 'package:get/get.dart';
import 'package:test1/service/model/product_id_model.dart';
import 'package:test1/service/model/product_store_model.dart';
import 'package:test1/service/model/update_product_model.dart';
import '../service/model/index_product_modle.dart';
import '../service/model/product_model.dart';
import '../service/model/response_model.dart';
import '../service/repository/product_repo.dart';
import '../widgets/Custom_snackpar/show_custom_snackPar_red.dart';

class ProductController extends GetxController {
  ProductRepo productRepo;
  ProductController({required this.productRepo});

  late List<Data> _productList = [];
  List<Data> get ProductList => _productList;
  late List<Data> _myproductList = [];
  List<Data> get MyProductList => _myproductList;
  late Product _product;
  Product get ItemProduct => _product;
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

  Future<ResponseModel> destroy_product(ProductId productDestroy) async {
    _isLoaded = true;
    ResponseModel responseModel;
    Response response = await productRepo.destroy(productDestroy);
    if (response.statusCode == 200) {
      _isLoaded = false;
      responseModel = ResponseModel(
          massage: response.body['message'].toString(), isSuccessful: true);
      update();
    } else {
      print(response.statusCode);
      ShowCustomSnackparRed('not done ', 'error');
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
      update();
    }
    _isLoaded = false;
    return responseModel;
  }

  Future<ResponseModel> show_product(ProductId view_id) async {
    _isLoaded = true;
    ResponseModel responseModel;
    Response response = await productRepo.show(view_id);
    if (response.statusCode == 200) {
      responseModel = ResponseModel(
          massage: response.body['message'].toString(), isSuccessful: true);
      _product = Product.fromJson(response.body);
      _isLoaded = false;
    } else {
      print(response.statusCode);
      ShowCustomSnackparRed('not done ', 'error');
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    _isLoaded = false;
    update();
    return responseModel;
  }
  Future<ResponseModel> update_product(UpdateProductModel updateProductModel) async {
    _isLoaded = true;
    ResponseModel responseModel;
    Response response = await productRepo.update(updateProductModel);
    if (response.statusCode == 200) {
      responseModel = ResponseModel(
          massage: response.body['message'].toString(), isSuccessful: true);
      _product = Product.fromJson(response.body);
      _isLoaded = false;
    } else {
      print(response.statusCode);
      ShowCustomSnackparRed('not done ', 'error');
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    print(response.statusCode);
    print('response.statusCode');
    _isLoaded = false;
    update();
    return responseModel;
  }
  Future<ResponseModel> store_Product(ProductStoreModel productStoreModel,List<int> img, String filename) async {
    _isLoaded = true;
    ResponseModel responseModel;
    Response response = await productRepo.store(img, filename, productStoreModel);
    print(response.statusCode);
    print("response.statusCode");
    if (response.statusCode == 200) {

      responseModel = ResponseModel(
          massage: response.body['message'].toString(), isSuccessful: true);
      _product = Product.fromJson(response.body);
      _isLoaded = false;
    } else {
      print(response.statusCode);
      ShowCustomSnackparRed('not done ', 'error');
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    print(response.statusCode);
    print('response.statusCode');
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
