import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth%20controller/auth_controller.dart';


class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }

}