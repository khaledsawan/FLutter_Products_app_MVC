// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test1/logic/Controllers/crud%20controller/insert_product_controller.dart';
// import 'package:test1/views/screens/crud/product_list.dart';
//
// enum ImageSourceType { gallery, camera }
//
// class EditProduct extends GetView<InsertProductController> {
//   EditProduct({Key? key}) : super(key: key);
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController phone_numberController = TextEditingController();
//   TextEditingController quantityController = TextEditingController();
//
//   InsertProductController controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         title: Title(
//           title: 'Title',
//           color: Colors.white,
//           child: Container(
//             child: Text(
//               'Add Products',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontStyle: FontStyle.italic,
//               ),
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           //onPressed:() => Navigator.pop(context, false),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child: Form(
//           child: ListView(
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 margin:
//                     EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10.0),
//                 //***********************************************************************
//
//                 //*************************************************************
//                 child: TextFormField(
//                   //initialValue: "gg",
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (v) {
//                     return controller.validateData(v!);
//                   },
//                   onSaved: (v) {
//                     controller.name != v;
//                   },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Name',
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 margin:
//                     EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10.0),
//                 //***********************************************************************
//
//                 //*************************************************************
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (v) {
//                     return controller.validateEmail(v!);
//                   },
//                   onSaved: (v) {
//                     controller.emailController != v;
//                   },
//                   controller: controller.emailController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 margin:
//                     EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10.0),
//                 //***********************************************************************
//
//                 //*************************************************************
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (v) {
//                     return controller.validatePrice(v!);
//                   },
//                   onSaved: (v) {
//                     controller.priceController != v;
//                   },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Price',
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 margin:
//                     EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10.0),
//                 //***********************************************************************
//
//                 //*************************************************************
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (v) {
//                     return controller.validatephonenumber(v!);
//                   },
//                   onSaved: (v) {
//                     controller.phone_numberController != v;
//                   },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'phone number',
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 margin:
//                     EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10.0),
//                 //***********************************************************************
//
//                 //*************************************************************
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (v) {
//                     return controller.validatenumbers(v!);
//                   },
//                   onSaved: (v) {
//                     controller.quantityController != v;
//                   },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'quantity',
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 margin:
//                     EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10.0),
//                 //***********************************************************************
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Obx(
//                 () => controller.isLoading.value == true
//                     ? Center(child: CircularProgressIndicator())
//                     : Text(""),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   height: 50,
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: RaisedButton(
//                     textColor: Colors.white,
//                     color: Colors.blue,
//                     child: Text('update'),
//                     onPressed: () {
//                       controller.update();
//                       Get.to(ProductsList());
//                     },
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
