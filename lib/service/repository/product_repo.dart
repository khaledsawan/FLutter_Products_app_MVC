
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:test1/service/model/product_destroy.dart';
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
  Future<Response> destroy(ProductDestroy productDestroy) async {
    print(productDestroy.id);
    print("productDestroy.id");
    return await apiClient.postData(AppConstants.PRODUCT_URL_DESTROY,productDestroy.toJson());
  }
}
