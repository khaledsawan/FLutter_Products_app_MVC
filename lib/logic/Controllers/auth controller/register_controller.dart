import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test1/Database/Services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test1/routes/routes.dart';


class RegisterController extends GetxController {
  var isLoading = false.obs;
  final registerForKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      phone_noController,
      passwordController;
  String name = '', email = '', password = '', phone_no = '';
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phone_noController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phone_noController.dispose();
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

  String? validatephone_no(String value) {
    if (!GetUtils.isPhoneNumber(value))
      return "enter phone number ";
    else
      return null;
  }

  String? validatename(String value) {
    if (value.length <= 3)
      return "short name ";
    else
      return null;
  }

  DoRegister() async {
    bool invalidate = registerForKey.currentState!.validate();
    if (invalidate) {
      isLoading(true);
      try {
        var data = await AuthService.register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            phone_no: phone_noController.text);
        if (data != null) {
          storage.write(key: "name", value: data.user.name);
          storage.write(key: "token", value: data.token);
          storage.write(key: "id", value: data.user.id.toString());
          registerForKey.currentState!.save();
          Get.toNamed(AppRoutes.products);
        } else {
          Get.snackbar("", "problem in register");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
