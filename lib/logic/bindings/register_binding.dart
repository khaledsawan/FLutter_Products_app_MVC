import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth%20controller/auth_controller.dart';
import 'package:test1/logic/Controllers/auth%20controller/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(()=>AuthController());
  }

}