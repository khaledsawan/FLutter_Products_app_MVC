import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test1/Database/Services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test1/routes/routes.dart';

class Login_Controller extends GetxController {
  var isLoading = false.obs;
  final loginForKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  String email = '', password = '';
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value))
      return "email not validate";
    else
      return null;
  }

  String? validatePassword(String value) {
    if (value.length <= 6)
      return "short password";
    else
      return null;
  }

  DoLogin() async {
    bool invalidate = loginForKey.currentState!.validate();
    if (invalidate) {
      isLoading(true);
      try {
        var data = await AuthService.login(
            email: emailController.text, password: passwordController.text);
        if (data != null) {
          storage.write(key: "name", value: data.user.name);
          storage.write(key: "token", value: data.token);
          loginForKey.currentState!.save();
          Get.toNamed(AppRoutes.products);
        } else {
          Get.snackbar("", "email or password not correct!");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
