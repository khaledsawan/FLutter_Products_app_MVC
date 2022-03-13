import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';
import 'package:test1/logic/Controllers/register_controller.dart';

class Register_Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Register_Controller());
    Get.put(AuthController());
  }

}