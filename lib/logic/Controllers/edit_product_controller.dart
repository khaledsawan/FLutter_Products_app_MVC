import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test1/Database/Services/products_services.dart';
import 'package:test1/routes/routes.dart';

class EditProduct_Controller extends GetxController {
  var isLoading = false.obs;
  final insertProductForKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      priceController,
      phone_numberController,
      quantityController;

  String name = '', email = '', price = '', quantity = '', phone_number = '';

  @override
  void onInit() {
    nameController = TextEditingController();

    priceController = TextEditingController();

    phone_numberController = TextEditingController();
    quantityController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();

    priceController.dispose();
    phone_numberController.dispose();
    quantityController.dispose();

    super.dispose();
  }

  String? validateData(String value) {
    if (value.length < 1)
      return "Empty";
    else
      return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value))
      return "email not validate";
    else
      return null;
  }

  String? validatephonenumber(String value) {
    if (!GetUtils.isPhoneNumber(value))
      return "not phone number";
    else
      return null;
  }

  String? validatenumbers(String value) {
    if (!GetUtils.isNum(value))
      return "not number";
    else
      return null;
  }

  String? validateimageURL(String value) {
    if (!GetUtils.isURL(value))
      return "image not validate";
    else
      return null;
  }

  String? validatePrice(String value) {
    if (!GetUtils.isNum(value))
      return "Price not validate";
    else
      return null;
  }

  updateproduct() async {
    bool invalidate = insertProductForKey.currentState!.validate();
    if (invalidate) {
      isLoading(true);
      try {
        var data = Products_Services.UpDateProduct(
          price: priceController.text,
          phone_number: phone_numberController,
          quantity: quantityController,
          name: nameController,
          id: null,
        );
        if (data != null) {
          Get.toNamed(AppRoutes.myproducts);
        } else {
          Get.snackbar("", " there is problem!");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
