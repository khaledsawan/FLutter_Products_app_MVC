import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/products_controller.dart';
import '../../../routes/routes.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  _loadResourses() async {
    await Get.find<ProductController>().getPopularProductList();
  }

  @override
  void initState() {
    _loadResourses();
    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    Timer(const Duration(seconds: 3), () => Get.offNamed(AppRoutes.mainpage));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: width,
          height: height,
          child: Image.asset(
            "images/assets/market-logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
