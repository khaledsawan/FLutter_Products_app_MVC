import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth%20controller/register_controller.dart';
import 'package:test1/routes/routes.dart';

import '../../../utils/colors/colors.dart';

// ignore: must_be_immutable
class Signup extends GetView<RegisterController> {
  Signup({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phone_noController = TextEditingController();
  RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double widht = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.appparcolor,
          automaticallyImplyLeading: true,
          title: Title(
              title: 'Title',
              color: Colors.white,
              child: Container(
                child: Text(
                  'Sign Up'.tr,
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ))),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.backGruond,
            ),
            child: Form(
              key: controller.registerForKey,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        'Sign Up'.tr,
                        style: TextStyle(
                          fontSize: 50,
                          fontStyle: FontStyle.italic,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widht,
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.nameController,
                        onSaved: (v) {
                          controller.name = v!;
                        },
                        validator: (v) {
                          return controller.validatename(v!);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name'.tr,
                          prefixIcon: Padding(
                            padding:
                                EdgeInsets.only(), // add padding to adjust icon
                            child: Icon(
                              Icons.person,
                              color: AppColors.purple_icon,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widht,
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.emailController,
                      onSaved: (v) {
                        controller.email = v!;
                      },
                      validator: (v) {
                        return controller.validateEmail(v!);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email'.tr,
                        prefixIcon: Padding(
                          padding:
                              EdgeInsets.only(), // add padding to adjust icon
                          child: Icon(
                            Icons.mail,
                            color: AppColors.purple_icon,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widht,
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    margin: EdgeInsets.only(
                        left: 0, top: 0, right: 0, bottom: 10.0),
                    child: TextFormField(
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (v) {
                        controller.email = v!;
                      },
                      validator: (v) {
                        return controller.validatePassword(v!);
                      },
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password'.tr,
                        prefixIcon: Padding(
                          padding:
                              EdgeInsets.only(), // add padding to adjust icon
                          child: Icon(
                            Icons.lock_open,
                            color: AppColors.purple_icon,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widht,
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    margin: EdgeInsets.only(
                        left: 0, top: 0, right: 0, bottom: 10.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (v) {
                        controller.phone_no = v!;
                      },
                      validator: (v) {
                        return controller.validatephone_no(v!);
                      },
                      controller: controller.phone_noController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number'.tr,
                        prefixIcon: Padding(
                          padding:
                              EdgeInsets.only(), // add padding to adjust icon
                          child: Icon(
                            Icons.phone_android,
                            color: AppColors.purple_icon,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widht,
                    height: 5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => controller.isLoading.value == true
                        ? Center(child: CircularProgressIndicator())
                        : Text(""),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: height * 0.08,
                      padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: AppColors.purple_icon,
                        shape: StadiumBorder(side: BorderSide()),
                        child: Text(
                          'Continue'.tr,
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          Get.toNamed(AppRoutes.products);
                          controller.DoRegister();
                        },
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
