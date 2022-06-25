import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../utils/AppConstants.dart';
import '../api/api_client.dart';

class PopularProductRepo extends GetxService {

  late final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> GetProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }
}
