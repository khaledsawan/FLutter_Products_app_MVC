import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test1/controller/products_controller.dart';
import 'package:test1/service/model/product_id_model.dart';
import 'package:test1/views/screens/crud/edit_product_page.dart';
import 'package:test1/widgets/Custom_snackpar/show_custom_snackPar_red.dart';
import 'package:test1/widgets/text/big_text.dart';
import '../../../routes/routes.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors/colors.dart';
import '../../../widgets/text/smail_text.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage(ProductController productController, {Key? key}) : super(key: key);

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  @override
  ChangeLanguageAlertDialog(BuildContext context, double height, double width,
      int id, ProductController productController) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(45.0),
      )),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(left: 70, right: 70),
      content: Container(
          height: height * 0.13,
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 4,
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                 await productController
                      .show_product(ProductId(id: id))
                      .then((status) {
                    if (status.isSuccessful!) {
                      Get.to(EditProductPage());
                    } else {
                      ShowCustomSnackparRed(status.massage.toString(), 'Error');
                    }
                  });
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.upcoming_outlined,
                        size: 35,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      BigText(textbody: 'Update Product'.tr)
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 4, top: 2),
                height: 1,
                color: AppColors.gray400,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  productController
                      .destroy_product(ProductId(id: id));
                  Navigator.of(context, rootNavigator: true).pop();
                  await productController.getMyProduct();
                  await productController.getProductList();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete_forever_outlined,
                      size: 40,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    BigText(textbody: 'Delete Product'.tr)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 4, top: 2),
                height: 1,
                color: AppColors.gray400,
              ),
            ],
          ))),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        color: AppColors.backGroundColor,
        child: GetBuilder<ProductController>(
          builder: (controller) {

            return controller.isLoaded
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ))
                : ListView.builder(
                    itemCount: controller.MyProductList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.show_product(ProductId(
                              id: controller.MyProductList[index].id!));
                          controller.MyProductList[index].view =
                              controller.MyProductList[index].view! + 1;
                          Get.toNamed(AppRoutes.productDetails);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.backGroundColor),
                          height: height * 0.38,
                          margin: EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          padding: EdgeInsets.all(4),
                          child: Stack(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(1),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: height * 0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin:
                                            const EdgeInsets.only(bottom: 50),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.gray800),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(
                                                  1.0,
                                                  1.0,
                                                ),
                                                blurRadius: 4.0,
                                                spreadRadius: 1.0,
                                              ), //BoxShadow
                                              BoxShadow(
                                                color: Colors.white,
                                                offset: Offset(0.0, 0.0),
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ],
                                            color: index.isEven
                                                ? const Color(0xFF69c5df)
                                                : const Color(0xFF9294cc),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  AppConstants.BASE_URL +
                                                      '/public/Image/' +
                                                      controller
                                                          .MyProductList[index]
                                                          .image!),
                                            )),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      left: width - 85,
                                      top: 12,
                                      child: GestureDetector(
                                        onTap: () {
                                          ChangeLanguageAlertDialog(
                                              context,
                                              height,
                                              width,
                                              controller
                                                  .MyProductList[index].id!,
                                              controller);
                                        },
                                        child: Icon(
                                          Icons.list,
                                          color: Colors.black45,
                                          size: 40,
                                        ),
                                      )),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  width: double.maxFinite,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color(0xFFe8e8e8),
                                            blurRadius: 5.0,
                                            offset: Offset(0, 5)),
                                        BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(-5, 0)),
                                        BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(5, 0))
                                      ]),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    margin: const EdgeInsets.only(top: 1),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.MyProductList[index].name!,
                                          style: TextStyle(
                                              color: AppColors.mainColor),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .production_quantity_limits,
                                                  color: AppColors.yellowColor,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                SmailText(
                                                    maxline: 1,
                                                    textbody: controller
                                                        .MyProductList[index]
                                                        .quantity!
                                                        .toString(),
                                                    color:
                                                        AppColors.yellowColor),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.category_outlined,
                                                  color: AppColors.blue,
                                                  size: 19,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                SmailText(
                                                  textbody: controller
                                                      .MyProductList[index]
                                                      .category!,
                                                  color: AppColors.blue,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.remove_red_eye,
                                                  color: AppColors.iconColor2,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                  height: 2,
                                                ),
                                                SmailText(
                                                    maxline: 1,
                                                    textbody: controller
                                                        .MyProductList[index]
                                                        .view!
                                                        .toString(),
                                                    color:
                                                        AppColors.iconColor2),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
