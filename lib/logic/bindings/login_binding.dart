import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth%20controller/auth_controller.dart';
import 'package:test1/logic/Controllers/auth%20controller/loginController.dart';


class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Login_Controller());
    Get.lazyPut(()=>AuthController());
  }

}