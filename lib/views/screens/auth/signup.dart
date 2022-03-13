import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/logic/Controllers/register_controller.dart';
import 'package:test1/routes/routes.dart';

// ignore: must_be_immutable
class Signup extends GetView<Register_Controller> {
  Signup({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phone_noController = TextEditingController();
  Register_Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF111631),
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
              color: Color(0xFF0A0E21),
            ),
            child: Form(
              key: controller.registerForKey,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        'Sign Up'.tr,
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          color: Color(0xDA00BBFF),
                        ),
                      ),
                    ),
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
                              color: Color(0xFF7423A8),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            color: Color(0xFF7423A8),
                          ),
                        ),
                      ),
                    ),
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
                            color: Color(0xFF7423A8),
                          ),
                        ),
                      ),
                    ),
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
                            color: Color(0xFF7423A8),
                          ),
                        ),
                      ),
                    ),
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
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xFF2A0445),
                        shape: StadiumBorder(side: BorderSide()),
                        child: Text('Continue'.tr),
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
