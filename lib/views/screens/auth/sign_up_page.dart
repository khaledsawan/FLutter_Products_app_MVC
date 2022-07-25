import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/widgets/Custom_snackpar/show_custom_snackpar_green.dart';
import '../../../controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../service/model/user_signUp_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../widgets/Custom_snackpar/show_custom_snackPar_red.dart';
import 'sign_in_page.dart';

class SignUpPage extends GetView<AuthController> {
  SignUpPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  void _registeration(AuthController authController) async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (name.isEmpty) {
      ShowCustomSnackparRed('enter name', 'name is empty');
    }else if (name.length<2) {
      ShowCustomSnackparRed('short email', 'The name must be at least two letters long');
    } else if (email.isEmpty) {
      ShowCustomSnackparRed('enter email', 'email is empty');
    } else if (!GetUtils.isEmail(email)) {
      ShowCustomSnackparRed('not email', 'not email');
    } else if (password.isEmpty) {
      ShowCustomSnackparRed('enter password', 'password is empty');
    } else if (password.length < 6) {
      ShowCustomSnackparRed('short password must more than 6 characters','short password');
    } else {
      UserSignUpModel signUpModel = UserSignUpModel(
          name: name.toString(),
          email: email.toString(),
          password: password.toString());
      authController.register_function(signUpModel).then((status) {
        if (status.isSuccessful!) {
          print('registration is done');
          Get.offAllNamed(AppRoutes.mainpage);
        } else {
          ShowCustomSnackparRed(
              status.massage.toString() + 'email is using be for', 'error');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: height * 0.045,
              width: width,
            ),
            SizedBox(
              height: height * 0.26,
              width: width * 0.55,
              child: Image.asset(
                'images/assets/signupuser.png',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                    child: GetBuilder<AuthController>(builder: (controller) {
                  return Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Hello'.tr,
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: AppColors.titleColor),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            ' create new account'.tr,
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          )),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
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
                          controller: nameController,
                          style: TextStyle(color: AppColors.titleColor),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'name'.tr,
                            hintStyle: TextStyle(color: Color(0xFFccc7c5)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Color(0xFF89dad0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
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
                          controller: emailController,
                          style: TextStyle(color: AppColors.titleColor),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'email'.tr,
                            hintStyle: TextStyle(color: Color(0xFFccc7c5)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF89dad0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: AppColors.titleColor),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'password'.tr,
                            hintStyle: TextStyle(color: Color(0xFFccc7c5)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
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
                      SizedBox(
                        height: 35,
                        width: width,
                      ),
                      GestureDetector(
                        onTap: () {
                          _registeration(controller);
                        },
                        child: Container(
                          height: 65,
                          width: width * 0.46,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            border:
                                Border.all(width: 1, color: AppColors.gray400),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Center(
                            child: Text(
                              'Sign up '.tr,
                              style:
                                  TextStyle(fontSize: 28, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: 40,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.only(bottom: 15),
                        child: RichText(
                          text: TextSpan(
                            text: 'You have an account? '.tr,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('tip');
                                      Get.to(() => SignInPage(),
                                          transition: Transition.fade);
                                    },
                                  text: 'SignIn '.tr,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                })),
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
