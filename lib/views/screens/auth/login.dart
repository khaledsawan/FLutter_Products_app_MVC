import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth%20controller/loginController.dart';
import 'package:test1/routes/routes.dart';
import 'package:test1/utils/colors/colors.dart';
import 'package:test1/widgets/text/big_text.dart';

class Login extends GetView<Login_Controller> {
  Login({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Login_Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double widht = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: !controller.isload
          ? Center(
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
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child:
                            Text('press Sign Up than Continue for demo data'),
                      ),
                      SizedBox(
                        width: widht,
                        height: 5,
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
                              padding: EdgeInsets
                                  .only(), // add padding to adjust icon
                              child: Icon(
                                Icons.mail_outline,
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
                              padding: EdgeInsets
                                  .only(), // add padding to adjust icon
                              child: Icon(
                                Icons.lock_open,
                                color: AppColors.purple_icon,
                              ),
                            ),
                            labelText: 'Password'.tr,
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
                          width: widht * 0.5,
                          padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
                          child: RaisedButton(
                            textColor: Colors.white,
                            shape: StadiumBorder(side: BorderSide()),
                            color: AppColors.purple_icon,
                            child: Text(
                              'Login'.tr,
                              style: TextStyle(fontSize: 24),
                            ),
                            onPressed: () {
                              //Get.to(Signup());
                              controller.DoLogin();
                            },
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(1, 50, 1, 0),
                        margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Does not have account?'.tr,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.toNamed(AppRoutes.signup);
                              },
                                child: BigText(
                              textbody: ' Sign Up'.tr,
                              color: AppColors.purple_icon,
                            )),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: AppColors.purple_icon,
              ),
            ),
    );
  }
}
