import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/views/screens/auth/sign_up_page.dart';

import '../../../controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../service/model/user_signin_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../widgets/Custom_snackpar/show_custom_snackpar_green.dart';
import '../../../widgets/Custom_snackpar/show_custom_snackpar_red.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _login_method() {
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    if (phone.isEmpty) {
      ShowCustomSnackparRed('enter phone number ', 'empty field');
    } else if (!phone.isNum) {
      ShowCustomSnackparRed('you need to enter numbers only', 'not phone number');
    } else if (password.isEmpty) {
      ShowCustomSnackparRed('enter your password ', 'empty field');
    } else if (password.length < 6) {
      ShowCustomSnackparRed(
          'short password must more than 6 characters', 'short password');
    } else {
      ShowCustomSnackparGreen('everything perfect', 'Weldon');
      Get.toNamed(AppRoutes.mainpage);
      // UserSingInModel userLoginModel = new UserSingInModel(phone, password);
      // authController.login_function(userLoginModel).then((status) {
      //   if (status.isSuccessful!) {print('registeration is done');Get.offAllNamed(AppRoutes.mainpage);} else {ShowCustomSnackpar(status.massage.toString() + ' password or phone number not correct', 'error');}
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body:  Column(
                  children: [
                    SizedBox(
                      height: height * 0.045,
                      width: width,
                    ),
                    SizedBox(
                      height: height * 0.26,
                      width: width * 0.55,
                      child: Image.asset(
                        'images/assets/userlogin.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  alignment: Alignment.topLeft,
                                  child:  Text(
                                    'Hello'.tr,
                                    style: TextStyle(
                                        fontSize: 60,
                                        color: AppColors.titleColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  alignment: Alignment.topLeft,
                                  child:  Text(
                                    'sign into your account'.tr,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  )),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6,
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                      )
                                    ],
                                    border: Border()),
                                child: TextFormField(
                                  controller: phoneController,
                                  style: TextStyle(color: AppColors.titleColor),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration:  InputDecoration(
                                    hintText: 'phone number'.tr,
                                    hintStyle:
                                        TextStyle(color: Color(0xFFccc7c5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35)),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35)),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    prefixIcon: Icon(
                                      Icons.phone_android,
                                      color: Color(0xFF89dad0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6,
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                      )
                                    ],
                                    border: Border()),
                                child: TextFormField(
                                  controller: passwordController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: TextStyle(color: AppColors.titleColor),
                                  obscureText: true,
                                  decoration:  InputDecoration(
                                    hintText: 'password'.tr,
                                    hintStyle:
                                        TextStyle(color: Color(0xFFccc7c5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35)),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35)),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets
                                          .only(), // add padding to adjust icon
                                      child: Icon(
                                        Icons.password,
                                        color: Color(0xFF89dad0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(child: Container()),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 10),
                                    child:  Text(
                                      'forget your password? '.tr,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                                width: width,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _login_method();
                                },
                                child: Container(
                                  height: 60,
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    border: Border.all(width: 1,color: AppColors.gray400),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child:  Center(
                                    child: Text(
                                      'Sign in '.tr,
                                      style: TextStyle(
                                          fontSize: 28, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width,
                                height: 30,
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                margin: const EdgeInsets.only(bottom: 15),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Don\'t have an account? '.tr,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.to(() => SignUpPage(),
                                                  transition: Transition.fade);
                                            },
                                          text: 'Create '.tr,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              // : Center(
              //     child: CircularProgressIndicator(
              //       color: AppColors.mainColor,
              //       backgroundColor: Colors.white,
              //     ),
              //   );
    );
  }
}

// GetBuilder<AuthController>(builder: (controller) {
// return !controller.isloading
// ?