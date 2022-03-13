import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/logic/Controllers/login_controller.dart';
import 'package:test1/routes/routes.dart';

class Login extends GetView<Login_Controller> {
  Login({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Login_Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: controller.loginForKey,
            child: ListView(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Login'.tr,
                      style: TextStyle(
                        fontSize: 50,
                        fontStyle: FontStyle.italic,
                        color: Color(0xDA00BBFF),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child:
                  Text('press Sign Up than Continue for demo data'),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      return controller.validateEmail(v!);
                    },
                    onSaved: (v) {
                      controller.emailController != v;
                    },
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email'.tr,
                      prefixIcon: Padding(
                        padding:
                            EdgeInsets.only(), // add padding to adjust icon
                        child: Icon(
                          Icons.mail_outline,
                          color: Color(0xFF7423A8),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  margin:
                      EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10.0),
                  child: TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      return controller.validatePassword(v!);
                    },
                    onSaved: (v) {
                      controller.passwordController != v;
                    },
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Padding(
                        padding:
                            EdgeInsets.only(), // add padding to adjust icon
                        child: Icon(
                          Icons.lock_open,
                          color: Color(0xFF7423A8),
                        ),
                      ),
                      labelText: 'Password'.tr,
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
                      shape: StadiumBorder(side: BorderSide()),
                      color: Color(0xFF2A0445),
                      child: Text('Login'.tr),
                      onPressed: () {
                        //Get.to(Signup());
                        controller.DoLogin();
                      },
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                  margin: EdgeInsets.fromLTRB(5,10,0,0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Does not have account?'.tr,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      FlatButton(
                        textColor: Color(0xFF7423A8),
                        child: Text(
                          'Sign Up'.tr,
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Get.toNamed(AppRoutes.signup);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
