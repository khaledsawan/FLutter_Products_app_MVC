import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';
import 'package:test1/logic/Controllers/insert_product_controller.dart';

class insert_Product_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Insert_Product_Controller());
    Get.put(AuthController());
  }
}