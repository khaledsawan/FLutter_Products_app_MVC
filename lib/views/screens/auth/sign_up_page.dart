import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test1/widgets/text/big_text.dart';

import '../../../controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../service/model/user_signup_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../widgets/Custom_snackpar/show_custom_snackpar.dart';
import '../../../widgets/inputtextform/inputtextform.dart';
import '../../../widgets/text/smail_text.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

List<String> IconList = [
  "g.png",
  "f.png",
  "t.png",
];
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
void _registeration(AuthController authController) {
  String name = nameController.text.trim();
  String email = emailController.text.trim();
  String phone = phoneController.text.trim();
  String password = passwordController.text.trim();
  if (name.isEmpty) {
    ShowCustomSnackpar('enter name', 'name is empty');
  } else if (email.isEmpty) {
    ShowCustomSnackpar('enter email', 'email is empty');
  } else if (!GetUtils.isEmail(email)) {
    ShowCustomSnackpar('not email', 'not email');
  } else if (!GetUtils.isNum(phone)) {
    ShowCustomSnackpar('you need to enter number', 'not number');
  } else if (password.isEmpty) {
    ShowCustomSnackpar('enter password', 'password is emoty');
  } else if (password.length < 6) {
    ShowCustomSnackpar(
        'short password must more than 6 characters', 'short password');
  } else {
    UserSignUpModel signUpModel = UserSignUpModel(name, phone, email, password);

    authController.register_function(signUpModel).then((status) {
      if (status.isSuccessful!) {
        print('registration is done');
        Get.offNamed(AppRoutes.mainpage);
      } else {
        ShowCustomSnackpar(
            status.massage.toString() + ' password or phone number not correct',
            'error');
      }
    });
  }
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (controller) {
          return !controller.isloading
              ? SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                    child: SizedBox(
                        width: width * 0.7,
                        height: height * 0.2,
                        child: Image.asset('assets/image/logo part 1.png'))),
                InputTextForm(
                    textInputType: TextInputType.name,
                    icon: Icons.person,
                    hintcolor: AppColors.textColor,
                    hintText: 'name',
                    color: AppColors.mainColor,
                    textEditingController: nameController),
                SizedBox(
                  height: height * 0.03,
                ),
                InputTextForm(
                    textInputType: TextInputType.emailAddress,
                    icon: Icons.email,
                    hintcolor: AppColors.textColor,
                    hintText: 'email',
                    color: AppColors.mainColor,
                    textEditingController: emailController),
                SizedBox(
                  height: height * 0.03,
                ),
                InputTextForm(
                    textInputType: TextInputType.phone,
                    icon: Icons.phone,
                    hintcolor: AppColors.textColor,
                    hintText: 'phone',
                    color: AppColors.mainColor,
                    textEditingController: phoneController),
                SizedBox(
                  height: height * 0.03,
                ),
                InputTextForm(
                  textInputType: TextInputType.text,
                  icon: Icons.password,
                  hintcolor: AppColors.textColor,
                  hintText: 'password',
                  color: AppColors.mainColor,
                  textEditingController: passwordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    _registeration(controller);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: height * 0.07,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: GestureDetector(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const SignInPage());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                              textbody: 'have an user account ',
                              color: AppColors.textColor,
                              size: 18,
                            ),
                            BigText(
                              textbody: 'already?',
                              color: Colors.black,
                              size: 18,
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: height * 0.080,
                ),
                SmailText(
                  textbody: 'Sign up using one of the following method',
                  size: 18,
                  color: AppColors.textColor,
                ),
                Wrap(
                  children: List.generate(
                      3,
                          (index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              "assets/image/" + IconList[index]),
                        ),
                      )),
                ),
              ]))
              : Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor,
              backgroundColor: Colors.white,
            ),
          );
        }));
  }
}
