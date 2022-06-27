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
