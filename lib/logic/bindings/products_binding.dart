import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth%20controller/auth_controller.dart';
import 'package:test1/logic/Controllers/crud%20controller/products_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
    Get.lazyPut(()=>AuthController());
  }
}
