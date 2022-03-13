import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';
import 'package:test1/logic/Controllers/login_controller.dart';


class Login_Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Login_Controller());
    Get.put(AuthController());
  }

}