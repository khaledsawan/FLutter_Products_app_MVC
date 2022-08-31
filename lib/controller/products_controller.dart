import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test1/service/model/product_id_model.dart';
import 'package:test1/service/model/product_store_model.dart';
import 'package:test1/service/model/update_product_model.dart';
import '../service/model/index_product_model.dart';
import '../service/model/product_model.dart';
import '../service/model/response_model.dart';
import '../service/repository/product_repo.dart';
import '../widgets/Custom_snackpar/show_custom_snackPar_red.dart';
import 'dart:io';

class ProductController extends GetxController {
  ProductRepo productRepo;
  ProductController({required this.productRepo});

  late List<Data> _productList = [];
  List<Data> get ProductList => _productList;

  late List<Data> _myProductList = [];
  List<Data> get MyProductList => _myProductList;

  late Product _product;
  Product get ItemProduct => _product;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  PickedFile? _pickedFile;
  PickedFile? get pickedFile => pickedFile;
  File? _image;

  final _picker = ImagePicker();
  Future<void> pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      _image = File(_pickedFile!.path);
      update();
    }
  }

  Future<ResponseModel> store_Product(
      ProductStoreModel productStoreModel) async {
    ResponseModel responseModel;
    _isLoaded = true;
    update();
    Response response = await productRepo.store(productStoreModel);
    if (response.statusCode == 200) {
      _isLoaded = false;
      update();
      responseModel = ResponseModel(massage: response.statusText.toString(), isSuccessful: true);
      update();
    } else {
      _isLoaded = false;
      update();
      responseModel = ResponseModel(massage: response.statusText.toString(), isSuccessful: false);
      update();
    }
    update();
    return responseModel;
  }

  Future<void> getProductList() async {
    _isLoaded = true;
    Response response = await productRepo.GetProductList();
    if (response.statusCode == 200) {
      _productList.addAll(IndexProductModel.fromJson(response.body).data);
      _isLoaded = false;
      update();
    } else {
      ShowCustomSnackparRed('check your internet connection', 'error');    }
    _isLoaded = false;
  }

  Future<void> getMyProduct() async {
    _isLoaded = true;
    Response response = await productRepo.GetProductList();
    if (response.statusCode == 200) {
      _myProductList.addAll(IndexProductModel.fromJson(response.body).data);
      _isLoaded = false;
      update();
    } else {
      ShowCustomSnackparRed('check your internet connection', 'error');     }
    _isLoaded = false;
  }

  Future<ResponseModel> destroy_product(ProductId productDestroy) async {
    _isLoaded = true;
    ResponseModel responseModel;
    Response response = await productRepo.destroy(productDestroy);
    if (response.statusCode == 200) {
      _isLoaded = false;
      responseModel = ResponseModel(massage: response.body['message'].toString(), isSuccessful: true);
      update();
    } else {
      print(response.statusCode);
      ShowCustomSnackparRed('not done ', 'error');
      responseModel = ResponseModel(massage: response.statusText!, isSuccessful: false);
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
      responseModel = ResponseModel(massage: response.body['message'].toString(), isSuccessful: true);
      _product = Product.fromJson(response.body);
      _isLoaded = false;
    } else {
      print(response.statusCode);
      ShowCustomSnackparRed('not done ', 'error');
      responseModel = ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    _isLoaded = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> update_product(
      UpdateProductModel updateProductModel) async {
    _isLoaded = true;
    ResponseModel responseModel;
    Response response = await productRepo.update(updateProductModel);
    if (response.statusCode == 200) {
      responseModel = ResponseModel(massage: response.body['message'].toString(), isSuccessful: true);
      _product = Product.fromJson(response.body);
      _isLoaded = false;
    } else {
      print(response.statusCode);
      ShowCustomSnackparRed('not done ', 'error');
      responseModel = ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    _isLoaded = false;
    update();
    return responseModel;
  }

}
