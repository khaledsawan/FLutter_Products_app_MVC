// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../controller/auth_controller.dart';
// import '../../../utils/AppConstants.dart';
// import '../../../utils/colors/colors.dart';
// import '../../../widgets/App_Icons/app_icons.dart';
// import '../../../widgets/icon_than_text/icon_than_text.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     SharedPreferences sharedPreferences = Get.find();
//     print('token is =>' +
//         sharedPreferences.getString(AppConstants.TOKEN).toString());
//     _logout(AuthController authController, CartController cartController,
//         AddressController addresscontroller) async {
//       await authController.clearUserAuth();
//       await cartController.clearsharedpreferences();
//       addresscontroller.clearAddressList();
//     }
//
//     bool _isLogin = Get.find<AuthController>().isAuth();
//
//     if (_isLogin) {
//       UserProfileController userProfileController = Get.find();
//       Get.find<AddressController>().getAddressList();
//
//       userProfileController.getProfileInfo().then((status) {
//         if (status.isSuccessful!) {
//           // Get.offAllNamed(AppRoutes.InitHome);
//         } else {}
//       });
//       //Get.find<LocationController>().getAddressList();
//       print('he is login ///////////////');
//       print(userProfileController.userProfileModel?.fName.toString());
//     } else {
//       print("not login ////////////");
//     }
//
//     return GetBuilder<UserProfileController>(builder: (profilecontroller) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.mainColor,
//           title: const Center(
//               child: Text(
//             'Profile',
//             style: TextStyle(fontSize: 24),
//           )),
//         ),
//         backgroundColor: Colors.white,
//         body: _isLogin
//             ? !profilecontroller.isLoaded
//                 ? SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           child: Container(
//                             color: Colors.white,
//                           ),
//                           height: 20,
//                         ),
//                         AppIcons(
//                           icon: Icons.person,
//                           iconSize: 75,
//                           containerSize: 150,
//                           backgruondcolor: AppColors.mainColor,
//                           iconColor: Colors.white,
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey[400]!,
//                                         offset: const Offset(
//                                           1,
//                                           1.2,
//                                         ),
//                                         blurRadius: 1.0,
//                                         spreadRadius: 1.0,
//                                       ),
//                                     ]),
//                                 margin: const EdgeInsets.only(
//                                     top: 15, left: 10, right: 10),
//                                 padding: const EdgeInsets.all(8),
//                                 child: Icon_Than_Text(
//                                   icon: Icons.person,
//                                   text: profilecontroller
//                                       .userProfileModel!.fName
//                                       .toString(),
//                                   color: AppColors.mainColor,
//                                 )),
//                             Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey[400]!,
//                                         offset: const Offset(
//                                           1,
//                                           1.2,
//                                         ),
//                                         blurRadius: 1.0,
//                                         spreadRadius: 1.0,
//                                       ),
//                                     ]),
//                                 margin: const EdgeInsets.only(
//                                     top: 15, left: 10, right: 10),
//                                 padding: const EdgeInsets.all(8),
//                                 child: Icon_Than_Text(
//                                   icon: Icons.phone,
//                                   text: profilecontroller
//                                       .userProfileModel!.phone
//                                       .toString(),
//                                   color: AppColors.yellowColor,
//                                 )),
//                             Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey[400]!,
//                                         offset: const Offset(
//                                           1,
//                                           1.2,
//                                         ),
//                                         blurRadius: 1.0,
//                                         spreadRadius: 1.0,
//                                       ),
//                                     ]),
//                                 margin: const EdgeInsets.only(
//                                     top: 15, left: 10, right: 10),
//                                 padding: const EdgeInsets.all(8),
//                                 child: Icon_Than_Text(
//                                   icon: Icons.email,
//                                   text: profilecontroller
//                                       .userProfileModel!.email
//                                       .toString(),
//                                   color: AppColors.yellowColor,
//                                 )),
//                             GestureDetector(
//                               onTap: () {
//                            //     Get.to(() => AddressPage());
//                               },
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(30),
//                                       color: Colors.white,
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey[400]!,
//                                           offset: const Offset(
//                                             1,
//                                             1.2,
//                                           ),
//                                           blurRadius: 1.0,
//                                           spreadRadius: 1.0,
//                                         ),
//                                       ]),
//                                   margin: const EdgeInsets.only(
//                                       top: 15, left: 10, right: 10),
//                                   padding: const EdgeInsets.all(8),
//                                   child: GetBuilder<AddressController>(
//                                     builder: (addressController) {
//                                       if (_isLogin &&
//                                           addressController
//                                               .addressTypeList.isEmpty) {
//                                         return Icon_Than_Text(
//                                           icon: Icons.location_on_outlined,
//                                           text: "Add your Address",
//                                           color: AppColors.yellowColor,
//                                         );
//                                       } else {
//                                         return Icon_Than_Text(
//                                           icon: Icons.location_on_outlined,
//                                           text: "your Address",
//                                           color: AppColors.yellowColor,
//                                         );
//                                       }
//                                     },
//                                   )),
//                             ),
//                             Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey[400]!,
//                                         offset: const Offset(
//                                           1,
//                                           1.2,
//                                         ),
//                                         blurRadius: 1.0,
//                                         spreadRadius: 1.0,
//                                       ),
//                                     ]),
//                                 margin: const EdgeInsets.only(
//                                     top: 15, left: 10, right: 10),
//                                 padding: const EdgeInsets.all(8),
//                                 child: Icon_Than_Text(
//                                   icon: Icons.perm_device_information_outlined,
//                                   text: 'massage',
//                                   color: Colors.red,
//                                 )),
//                             GestureDetector(
//                               onTap: () {
//                                 AuthController authController = Get.find();
//                                 CartController cartController = Get.find();
//                                 AddressController addresscontroller =
//                                     Get.find();
//
//                                 _logout(authController, cartController,
//                                     addresscontroller);
//                                 Get.offNamed(AppRoutes.LoginPage);
//                               },
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(30),
//                                       color: Colors.white,
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey[400]!,
//                                           offset: const Offset(
//                                             1,
//                                             1.2,
//                                           ),
//                                           blurRadius: 1.0,
//                                           spreadRadius: 1.0,
//                                         ),
//                                       ]),
//                                   margin: const EdgeInsets.only(
//                                       top: 15, left: 10, right: 10),
//                                   padding: const EdgeInsets.all(8),
//                                   child: Icon_Than_Text(
//                                     icon: Icons.logout,
//                                     text: 'Logout ',
//                                     color: Colors.red,
//                                   )),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 : Center(
//                     child: CircularProgressIndicator(
//                       color: AppColors.mainColor,
//                     ),
//                   )
//             : Center(
//                 child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: height * 0.05,
//                     ),
//                     Center(
//                       child: Container(
//                         width: width-20,
//                           height: height*0.25,
//                           child: Image.asset('assets/image/notlogin.png')),
//                     ),SizedBox(
//                       height: height * 0.02,
//                     ),
//                     Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             color: AppColors.mainColor,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey[400]!,
//                                 offset: const Offset(
//                                   1,
//                                   1.2,
//                                 ),
//                                 blurRadius: 1.0,
//                                 spreadRadius: 1.0,
//                               ),
//                             ]),
//                         margin:
//                             const EdgeInsets.only(top: 15, left: 60, right: 60),
//                         padding: const EdgeInsets.all(8),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               'you are not ',
//                               style:
//                                   TextStyle(fontSize: 22, color: Colors.white),
//                             ),
//                             GestureDetector(
//                                 onTap: () {
//                                   Get.toNamed(AppRoutes.LoginPage);
//                                 },
//                                 child: const Text(
//                                   'Login',
//                                   style: TextStyle(
//                                       fontSize: 22, color: Colors.white),
//                                 )),
//                             GestureDetector(
//                                 onTap: () {
//                                   Get.toNamed(AppRoutes.LoginPage);
//                                 },
//                                 child:  Icon(
//                                   Icons.login_outlined,
//                                   color: AppColors.yellowColor,
//                                   size: 30,
//                                 )),
//                           ],
//                         )),
//                   ],
//                 ),
//               )),
//       );
//     });
//   }
// }
