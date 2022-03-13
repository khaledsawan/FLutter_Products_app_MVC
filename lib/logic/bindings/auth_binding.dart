import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';


class Auth_Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }

}