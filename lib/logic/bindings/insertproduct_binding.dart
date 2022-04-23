import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth%20controller/auth_controller.dart';
import 'package:test1/logic/Controllers/crud%20controller/insert_product_controller.dart';

class InsertProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InsertProductController());
    Get.lazyPut(()=>AuthController());
  }
}