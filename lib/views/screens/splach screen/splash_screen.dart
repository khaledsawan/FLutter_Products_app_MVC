import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/utils/colors/colors.dart';
import 'package:test1/widgets/text/big_text.dart';

import '../../../logic/Controllers/crud controller/products_controller.dart';
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
    await Get.find<ProductController>().get_demo_ProductsController();
  }

  @override
  void initState() {
    _loadResourses();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3), () => Get.toNamed(AppRoutes.products));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backGruond,
      body: Center(
        child: Container(
          width: width * 0.7,
          height: height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: BigText(
                textbody: 'Welcome',
                color: AppColors.blue,
                fontStyle: FontStyle.italic,
                size: 50,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
