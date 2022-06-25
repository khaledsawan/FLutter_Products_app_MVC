import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/api/api_client.dart';
import '../service/repository/auth_repo.dart';
import '../utils/AppConstants.dart';


Future<void> init() async {

  final sharedPreferences=await SharedPreferences.getInstance();
  //Shared_preferences
  Get.lazyPut(() => sharedPreferences);
  //API
  Get.lazyPut(() => ApiClient(main_BaseUrl: AppConstants.BASE_URL, sharedPre: Get.find()));

  //Repositories
 // Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
 // Get.lazyPut(() => RecommendedProductsRepo(apiClient: Get.find()));
 // Get.lazyPut(() => CartRepo(sharedpreferences: Get.find()));
//  Get.lazyPut(() => UserProfileRepo(apiClient: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
 // Get.lazyPut(() => AddressRepo(apiClient: Get.find(),sharedPre: Get.find()));
//  Get.lazyPut(() => OrderRepo(apiClient: Get.find()));

  //Controllers
  // Get.lazyPut(() => AddressController(addressRepo: Get.find()));
  // Get.lazyPut(() => CartController(cartRepo: Get.find()));
  // Get.lazyPut(() => UserProfileController(userProfileReop: Get.find()));
  // Get.lazyPut(() => AuthController(authRepo: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  // Get.lazyPut(() => RecommendedProductsController(recommenedproductrepo:Get.find()));
  // Get.lazyPut(() => PlaceOrderController(orderRepo: Get.find()));

}
