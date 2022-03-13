import 'package:get/get.dart';
import 'package:test1/Database/Services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test1/routes/routes.dart';

class AuthController extends GetxController {
  var storage = FlutterSecureStorage();

  var name = ''.obs;
  static var token = '';
  @override
  void onInit() async{
   await authData();
    super.onInit();
  }

  authData() async {
    name.value = (await storage.read(key: "name"))!;
    token = (await storage.read(key: "token"))!;
  }

  Future<bool> isAuth() async{
    return await token.isNotEmpty;
  }

  DoLogout() async {
    AuthService.logout();
    await storage.deleteAll();
    Get.toNamed(AppRoutes.login);
  }
}
