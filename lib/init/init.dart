import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/controller/products_controller.dart';
import 'package:test1/service/repository/product_repo.dart';

import '../controller/auth_controller.dart';
import '../service/api/api_client.dart';
import '../service/repository/auth_repo.dart';
import '../utils/AppConstants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  //Shared_preferences
  Get.lazyPut(() => sharedPreferences);
  //API
  Get.lazyPut(() => ApiClient(main_BaseUrl: AppConstants.BASE_URL, sharedPre: Get.find()));
  //Repositories
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  //Controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ProductController(productRepo: Get.find()));

}
