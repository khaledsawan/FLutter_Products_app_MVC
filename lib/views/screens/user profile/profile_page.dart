import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors/colors.dart';
import '../../../widgets/App_Icons/app_icons.dart';
import '../../../widgets/icon_than_text/icon_than_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool _isLogin = Get.find<AuthController>().isAuth();

    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: const Center(
              child: Text(
            'Profile',
            style: TextStyle(fontSize: 24),
          )),
        ),
        backgroundColor: Colors.white,
        body: _isLogin
            ? !controller.isloading
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Container(
                            color: Colors.white,
                          ),
                          height: 20,
                        ),
                        Container(
                          width: width,
                          height: height*0.35,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/assets/me.jpg')
                            )
                          ),

                        ),
                        Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[400]!,
                                        offset: const Offset(
                                          1,
                                          1.2,
                                        ),
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ]),
                                margin: const EdgeInsets.only(
                                    top: 15, left: 10, right: 10),
                                padding: const EdgeInsets.all(8),
                                child: Icon_Than_Text(
                                  icon: Icons.person,
                                  text: controller.profileInfoModel.user!.name
                                      .toString(),
                                  color: AppColors.mainColor,
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[400]!,
                                        offset: const Offset(
                                          1,
                                          1.2,
                                        ),
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ]),
                                margin: const EdgeInsets.only(
                                    top: 15, left: 10, right: 10),
                                padding: const EdgeInsets.all(8),
                                child: Icon_Than_Text(
                                  icon: Icons.phone,
                                  text: '+963 967184204',
                                  color: AppColors.mainColor,
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[400]!,
                                        offset: const Offset(
                                          1,
                                          1.2,
                                        ),
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ]),
                                margin: const EdgeInsets.only(
                                    top: 15, left: 10, right: 10),
                                padding: const EdgeInsets.all(8),
                                child: Icon_Than_Text(
                                  icon: Icons.email,
                                  text: controller.profileInfoModel.user!.email
                                      .toString(),
                                  color: AppColors.mainColor,
                                )),

                            GestureDetector(
                              onTap: () async {
                                AuthController authController = Get.find();
                                await authController.clearUserAuth();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[400]!,
                                          offset: const Offset(
                                            1,
                                            1.2,
                                          ),
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ]),
                                  margin: const EdgeInsets.only(
                                      top: 15, left: 10, right: 10),
                                  padding: const EdgeInsets.all(8),
                                  child: Icon_Than_Text(
                                    icon: Icons.logout,
                                    text: 'Logout ',
                                    color: AppColors.red,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  )
            : Center(
                child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Center(
                      child: Container(
                          width: width - 20,
                          height: height * 0.25,
                          child: Image.asset('assets/image/notlogin.png')),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.mainColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400]!,
                                offset: const Offset(
                                  1,
                                  1.2,
                                ),
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                              ),
                            ]),
                        margin:
                            const EdgeInsets.only(top: 15, left: 60, right: 60),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'you are not ',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.login);
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                )),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.login);
                                },
                                child: Icon(
                                  Icons.login_outlined,
                                  color: AppColors.yellowColor,
                                  size: 30,
                                )),
                          ],
                        )),
                  ],
                ),
              )),
      );
    });
  }
}
