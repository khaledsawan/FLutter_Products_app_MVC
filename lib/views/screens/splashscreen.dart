import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';
import 'package:test1/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  AuthController authController = Get.find();

  @override
  _SplashScreenState createState() => _SplashScreenState(authController);
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState(this.authController);
  AuthController? authController;
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () async {
      if (await authController!.isAuth()) {
        Get.to(()=>AppRoutes.products);
      } else {
        Get.to(()=>AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Text(
          "Wolcome",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue),
        )),
      ),
    );
  }
}
