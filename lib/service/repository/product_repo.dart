import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:test1/service/model/product_id.dart';
import 'package:test1/service/model/update_product_model.dart';
import '../../utils/AppConstants.dart';
import '../api/api_client.dart';

class ProductRepo extends GetxService {
  late final ApiClient apiClient;

  ProductRepo({required this.apiClient});

  Future<Response> GetProductList() async {
    return await apiClient.getData(AppConstants.PRODUCT_URL);
  }

  Future<Response> GetMyProductList() async {
    return await apiClient.getData(AppConstants.PRODUCT_URL);
  }

  Future<Response> destroy(ProductId productDestroy) async {
    print(productDestroy.id);
    print("productDestroy.id");
    return await apiClient.postData(
        AppConstants.PRODUCT_URL_DESTROY, productDestroy.toJson());
  }

  Future<Response> show(ProductId view_id) async {
    print(view_id.id);
    print("view_id.id");
    return await apiClient.postData(
        AppConstants.PRODUCT_URL_SHOW, view_id.toJson());
  }

  Future<Response> update(UpdateProductModel updateProductModel) async {
    print(updateProductModel.quantity);
    print(updateProductModel.price);
    print(updateProductModel.category);
    print("view_id.id");
    return await apiClient.postData(
        AppConstants.PRODUCT_URL_UPDATE, updateProductModel.toJson());
  }
}
