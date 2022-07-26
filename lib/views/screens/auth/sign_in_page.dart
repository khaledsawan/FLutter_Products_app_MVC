import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/views/screens/auth/sign_up_page.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/products_controller.dart';
import '../../../routes/routes.dart';
import '../../../service/model/user_signIn_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../widgets/Custom_snackpar/show_custom_snackPar_red.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _login_method(AuthController authController) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty) {
      ShowCustomSnackparRed('enter your email ', 'empty field');
    } else if (!email.isEmail) {
      ShowCustomSnackparRed('you need to enter email only', 'not email ');
    } else if (password.isEmpty) {
      ShowCustomSnackparRed('enter your password ', 'empty field');
    } else if (password.length < 8) {
      ShowCustomSnackparRed(
          'short password must more than 8 characters', 'short password');
    } else {
      UserSingInModel userLoginModel = new UserSingInModel(email, password);
      authController.login_function(userLoginModel).then((status) async {
        if (status.isSuccessful!) {
          print('login is done');
        await  Get.find<ProductController>().getMyProduct().then((value) =>
        {
        Get.offAllNamed(AppRoutes.mainpage)
        });

        } else {
          ShowCustomSnackparRed(status.massage.toString() + '', 'error');
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
                'images/assets/userlogin.png',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
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
                                color: AppColors.titleColor,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'sign into your account'.tr,
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
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            child: Text(
                              'forget your password? '.tr,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
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
                          _login_method(controller);
                        },
                        child: Container(
                          height: 60,
                          width: width * 0.45,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            border:
                                Border.all(width: 1, color: AppColors.gray400),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Center(
                            child: Text(
                              'Sign in '.tr,
                              style:
                                  TextStyle(fontSize: 28, color: Colors.white),
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
