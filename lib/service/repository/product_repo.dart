import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:test1/service/model/product_id_model.dart';
import 'package:test1/service/model/update_product_model.dart';
import '../../utils/AppConstants.dart';
import '../api/api_client.dart';
import '../model/product_store_model.dart';

class ProductRepo extends GetxService {
  late final ApiClient apiClient;

  ProductRepo({required this.apiClient});

  Future<Response> GetProductList() async {
    return await apiClient.getData(AppConstants.PRODUCT_URL);
  }

  Future<Response> GetMyProductList() async {
    return await apiClient.getData(AppConstants.PRODUCT_URL);
  }

  Future<Response> store(
      List<int> img, String filename, ProductStoreModel productStoreModel) {
    print(productStoreModel.location);
    print(productStoreModel.price);
    print(productStoreModel.name);
    print(productStoreModel.quantity);
    print(productStoreModel.category);
    print(productStoreModel.descirption);
    print(img.toString());
    print(filename);
    print('product repo//////////////');
    return apiClient.postProduct(
        img, filename, AppConstants.PRODUCT_URL_STORE, productStoreModel);
  }

  Future<Response> destroy(ProductId productDestroy) async {
    return await apiClient.postData(
        AppConstants.PRODUCT_URL_DESTROY, productDestroy.toJson());
  }

  Future<Response> show(ProductId view_id) async {
    return await apiClient.postData(
        AppConstants.PRODUCT_URL_SHOW, view_id.toJson());
  }

  Future<Response> update(UpdateProductModel updateProductModel) async {
    return await apiClient.postData(
        AppConstants.PRODUCT_URL_UPDATE, updateProductModel.toJson());
  }
}
