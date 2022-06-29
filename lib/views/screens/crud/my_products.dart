// import 'package:flutter/material.dart';
// import 'package:test1/Database/model/product_model.dart';
// import 'package:test1/logic/Controllers/auth%20controller/auth_controller.dart';
// import 'package:test1/logic/Controllers/crud%20controller/products_controller.dart';
// import 'package:test1/views/screens/crud/product_detils.dart';
// import 'package:get/get.dart';
//
// class MyProducts extends GetView<ProductController> {
//   MyProducts({Key? key}) : super(key: key);
//
//   ProductController controller = Get.find();
//   AuthController authController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF111631),
//         title: Title(
//           title: 'Title',
//           color: Colors.white,
//           child: Container(
//             child: Text(
//               'My Products'.tr,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontStyle: FontStyle.italic,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: FutureBuilder(
//         future: controller.getmyProductsController(),
//         builder: (context, data) {
//           if (data.hasError) {
//             return Center(child: Text("${data.error}"));
//           } else if (data.hasData) {
//             var items = data.data as List<ProductMolde>;
//
//             return Container(
//               child: ListView.builder(
//                 itemCount: items == null ? 0 : items.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.to(ProductDetils(itemproduct: items[index]));
//                       },
//                       child: Column(
//                         children: [
//                           Card(
//                             elevation: 5,
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 6),
//                             child: Container(
//                               padding: EdgeInsets.all(8),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: 70,
//                                     height: 60,
//                                     margin: EdgeInsets.only(right: 5),
//                                     child: Image(
//                                       image: NetworkImage(
//                                           items[index].image.toString()),
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       padding: EdgeInsets.only(bottom: 8),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 8, right: 8),
//                                             child: Text(
//                                               items[index].name.toString(),
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ),
//                                           Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Padding(
//                                                   padding: EdgeInsets.only(
//                                                       left: 8,
//                                                       right: 8,
//                                                       top: 4),
//                                                   child: Text('category'.tr),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.only(
//                                                       left: 8, top: 4),
//                                                   child: Container(
//                                                     width: 20,
//                                                     height: 20,
//                                                     child: Image(
//                                                       image: AssetImage(
//                                                           'images/assets/like_heart.png'),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Padding(
//                                                   padding: EdgeInsets.only(
//                                                       left: 4,
//                                                       right: 8,
//                                                       top: 6),
//                                                   child: Text('32'),
//                                                 ),
//                                               ]),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 8, right: 8, top: 6),
//                                             child: Text("Price".tr +
//                                                 items[index].price.toString() +
//                                                 "\$"),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 8, right: 8, top: 6),
//                                             child: RaisedButton(
//                                               textColor: Colors.white,
//                                               color: Colors.blue,
//                                               onPressed: () {},
//                                               child: Text('Edit'.tr),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 8, right: 8, top: 6),
//                                             child: RaisedButton(
//                                               textColor: Colors.white,
//                                               color: Colors.blue,
//                                               onPressed: () {
//                                                 controller.deleteproduct(
//                                                     items[index].id);
//                                               },
//                                               child: Text('Delete'.tr),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test1/widgets/icon_than_text/icon_than_text.dart';
import 'package:test1/widgets/text/big_text.dart';

import '../../../utils/colors/colors.dart';
import '../../../widgets/text/smail_text.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  ChangeLanguageAlertDialog(BuildContext context, double height, double width) {
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
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.upcoming_outlined,
                      size: 35,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      width: width * 0.24,
                    ),
                    BigText(textbody: 'Update')
                  ],
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
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete_forever_outlined,
                      size: 40,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      width: width * 0.24,
                    ),
                    BigText(textbody: 'Delete')
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
        child: ListView.builder(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.backGroundColor),
              height: height * 0.38,
              margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
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
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(bottom: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    width: 1, color: AppColors.gray800),
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
                                  image:
                                      AssetImage('images/assets/blue_cart.png'),
                                )),
                          ),
                        ),
                      ),
                      Positioned(
                          left: width - 85,
                          top: 12,
                          child: GestureDetector(
                            onTap: () {
                              ChangeLanguageAlertDialog(context, height, width);
                            },
                            child: Icon(
                              Icons.list,
                              color: AppColors.yellowColor,
                              size: 40,
                            ),
                          )),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
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
                                color: Colors.white, offset: Offset(-5, 0)),
                            BoxShadow(color: Colors.white, offset: Offset(5, 0))
                          ]),
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        margin: const EdgeInsets.only(top: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'name',
                              style: TextStyle(color: AppColors.mainColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.production_quantity_limits,
                                      color: AppColors.yellowColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SmailText(
                                        maxline: 1,
                                        textbody: '5',
                                        color: AppColors.yellowColor),
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
                                      textbody: 'category',
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
                                    SmailText(
                                        maxline: 1,
                                        textbody: "1287 view",
                                        color: AppColors.iconColor2),
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
            );
          },
        ));
  }
}
