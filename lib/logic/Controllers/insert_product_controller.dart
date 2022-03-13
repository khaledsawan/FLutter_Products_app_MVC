import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class Insert_Product_Controller extends GetxController {
  var isLoading = false.obs;
  final insertProductForKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      imageURLController,
      categoryController,
      Expiration_dateController,
      priceController,
      phone_numberController,
      quantityController,
      common_infoController;


  String name = '',
      email = '',
      imageURL = '',
      category = '',
      Expiration_date = '',
      price = '',
      quantity = '',
      common_info = '',
      phone_number = '';


  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    imageURLController = TextEditingController();
    categoryController = TextEditingController();
    Expiration_dateController = TextEditingController();
    priceController = TextEditingController();
    phone_numberController = TextEditingController();
    quantityController = TextEditingController();
    common_infoController = TextEditingController();


    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    imageURLController.dispose();
    categoryController.dispose();
    Expiration_dateController.dispose();
    priceController.dispose();
    phone_numberController.dispose();
    quantityController.dispose();
    common_infoController.dispose();

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
      return "only number example :30" ;
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

  insertProduct() async {
    // bool invalidate = insertProductForKey.currentState!.validate();
    // if (invalidate) {
    //   isLoading(true);
    //   try {
    //     var data = Products_Services.CreateProduct(
    //       name: nameController.text,
    //       email: emailController.text,
    //       image: imageURLController.text,
    //       category: categoryController.text,
    //       price: priceController.text,
    //       exp_date: Expiration_dateController.text,
    //       phone_number: phone_numberController,
    //       quantity: quantityController,
    //       common_info: common_infoController,
    //     );
    //     if (data != null) {
    //       //Get.toNamed(AppRoutes.myproduct);
    //     } else {
    //       Get.snackbar("", " there is problem!");
    //     }
    //   } finally {
    //     isLoading(false);
    //   }
    // }
  }
}
