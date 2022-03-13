import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';
import 'package:test1/logic/Controllers/products_controller.dart';

class Product_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Product_Controller());
    Get.put(AuthController());
  }
}
