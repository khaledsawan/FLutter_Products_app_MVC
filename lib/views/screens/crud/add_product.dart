// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test1/views/screens/crud/product_list.dart';
//
// import '../../../utils/colors/colors.dart';
//
// enum ImageSourceType { gallery, camera }
//
// class AddProduct extends GetView<InsertProductController> {
//   AddProduct({Key? key}) : super(key: key);
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController imageURLController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController Expiration_dateController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController nameController_AR = TextEditingController();
//   TextEditingController phone_numberController = TextEditingController();
//   TextEditingController quantityController = TextEditingController();
//   TextEditingController common_infoController = TextEditingController();
//
//   InsertProductController controller = Get.find();
//   String dropdownvalue = 'Fruit'.tr;
//   @override
//   Widget build(BuildContext context) {
//     var items = [
//       'Fruit'.tr,
//       'Juice'.tr,
//       'Snacks'.tr,
//       'sandwich'.tr,
//       'Candy'.tr,
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.backGruond,
//         automaticallyImplyLeading: true,
//         title: Title(
//           title: 'Title',
//           color: Colors.white,
//           child: Container(
//             child: Text(
//               'Add Products'.tr,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontStyle: FontStyle.italic,
//                 color: AppColors.purple_icon,
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
//
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 margin:
//                     EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10.0),
//                 //***********************************************************************
//
//                 //*************************************************************
//                 child: DropdownButtonFormField(
//                   value: dropdownvalue,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//
//                   onSaved: (v) {
//                     controller.categoryController != v;
//                   },
//                   icon: const Icon(Icons.keyboard_arrow_down),
//
//                   // Array list of items
//                   items: items.map((String items) {
//                     return DropdownMenuItem(
//                       value: items,
//                       child: Text(items),
//                     );
//                   }).toList(),
//                   // After selecting the desired option,it will
//                   // change button value to selected value
//                   onChanged: (String? newValue) {
//                     dropdownvalue = newValue!;
//                   },
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
//                     labelText: 'Name'.tr,
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(), // add padding to adjust icon
//                       child: Icon(
//                         Icons.person,
//                         color: AppColors.purple_icon,
//                       ),
//                     ),
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
//                     labelText: 'Email'.tr,
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(), // add padding to adjust icon
//                       child: Icon(
//                         Icons.mail,
//                         color: AppColors.purple_icon,
//                       ),
//                     ),
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
//                     return controller.validateimageURL(v!);
//                   },
//                   onSaved: (v) {
//                     controller.imageURLController != v;
//                   },
//                   controller: controller.imageURLController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Image URL'.tr,
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(), // add padding to adjust icon
//                       child: Icon(
//                         Icons.image_outlined,
//                         color: AppColors.purple_icon,
//                       ),
//                     ),
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
//                   controller: Expiration_dateController,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (v) {
//                     return controller.validateData(v!);
//                   },
//                   onSaved: (v) {
//                     controller.Expiration_dateController != v;
//                   },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: ('Expiration Date'.tr),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(), // add padding to adjust icon
//                       child: Icon(
//                         Icons.date_range_outlined,
//                         color: AppColors.purple_icon,
//                       ),
//                     ),
//                   ),
//                   onTap: () async {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(DateTime.now().year - 10),
//                         lastDate: DateTime(DateTime.now().year + 10),
//                         builder: (context, picker) {
//                           return Theme(
//                             //TODO: change colors
//                             data: ThemeData.dark().copyWith(
//                               backgroundColor: Color(0xFF0A0E21),
//                               colorScheme: ColorScheme.dark().copyWith(
//                                 background: AppColors.backGruond,
//                                 primary: AppColors.purple_icon,
//                                 onSurface: Color(0xFFFFFFFF),
//                               ),
//                             ),
//                             child: picker!,
//                           );
//                         }).then((selectedDate) {
//                       if (selectedDate != null) {
//                         Expiration_dateController.text =
//                             selectedDate.toString().substring(0, 10);
//                         ;
//                       }
//                     });
//                   },
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
//                     controller.imageURLController != v;
//                   },
//                   controller: controller.priceController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Price'.tr,
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(), // add padding to adjust icon
//                       child: Icon(
//                         Icons.attach_money_outlined,
//                         color: AppColors.purple_icon,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               new Row(
//                 children: <Widget>[
//                   new Flexible(
//                     child: Container(
//                       padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                       margin: EdgeInsets.only(
//                           left: 0, top: 0, right: 0, bottom: 10.0),
//                       child: new TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (v) {
//                           return controller.validatenumbers(v!);
//                         },
//                         onSaved: (v) {
//                           controller.phone_numberController != v;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'first Discount example :30%'.tr,
//                           prefixIcon: Padding(
//                             padding:
//                                 EdgeInsets.only(), // add padding to adjust icon
//                             child: Icon(
//                               Icons.corporate_fare,
//                               color: AppColors.purple_icon,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   new Flexible(
//                     child: Container(
//                       padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                       margin: EdgeInsets.only(
//                           left: 0, top: 0, right: 0, bottom: 10.0),
//                       child: new TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (v) {
//                           return controller.validatenumbers(v!);
//                         },
//                         onSaved: (v) {
//                           controller.phone_numberController != v;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Price after Discount'.tr,
//                           prefixIcon: Padding(
//                             padding:
//                                 EdgeInsets.only(), // add padding to adjust icon
//                             child: Icon(
//                               Icons.price_change,
//                               color: AppColors.purple_icon,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               new Row(
//                 children: <Widget>[
//                   new Flexible(
//                     child: Container(
//                       padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                       margin: EdgeInsets.only(
//                           left: 0, top: 0, right: 0, bottom: 10.0),
//                       child: new TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (v) {
//                           return controller.validatenumbers(v!);
//                         },
//                         onSaved: (v) {
//                           controller.phone_numberController != v;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'second Discount example :50%'.tr,
//                           prefixIcon: Padding(
//                             padding:
//                                 EdgeInsets.only(), // add padding to adjust icon
//                             child: Icon(
//                               Icons.corporate_fare,
//                               color: AppColors.purple_icon,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   new Flexible(
//                     child: Container(
//                       padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                       margin: EdgeInsets.only(
//                           left: 0, top: 0, right: 0, bottom: 10.0),
//                       child: new TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (v) {
//                           return controller.validatenumbers(v!);
//                         },
//                         onSaved: (v) {
//                           controller.phone_numberController != v;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Price after Discount'.tr,
//                           prefixIcon: Padding(
//                             padding:
//                                 EdgeInsets.only(), // add padding to adjust icon
//                             child: Icon(
//                               Icons.price_change,
//                               color: AppColors.purple_icon,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               new Row(
//                 children: <Widget>[
//                   new Flexible(
//                     child: Container(
//                       padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                       margin: EdgeInsets.only(
//                           left: 0, top: 0, right: 0, bottom: 10.0),
//                       child: new TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (v) {
//                           return controller.validatenumbers(v!);
//                         },
//                         onSaved: (v) {
//                           controller.phone_numberController != v;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'third Discount'.tr,
//                           prefixIcon: Padding(
//                             padding:
//                                 EdgeInsets.only(), // add padding to adjust icon
//                             child: Icon(
//                               Icons.corporate_fare,
//                               color: AppColors.purple_icon,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   new Flexible(
//                     child: Container(
//                       padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                       margin: EdgeInsets.only(
//                           left: 0, top: 0, right: 0, bottom: 10.0),
//                       child: new TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (v) {
//                           return controller.validatephonenumber(v!);
//                         },
//                         onSaved: (v) {
//                           controller.phone_numberController != v;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Price after Discount'.tr,
//                           prefixIcon: Padding(
//                             padding:
//                                 EdgeInsets.only(), // add padding to adjust icon
//                             child: Icon(
//                               Icons.price_change,
//                               color: AppColors.purple_icon,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
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
//                     labelText: 'Phone Number'.tr,
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(), // add padding to adjust icon
//                       child: Icon(
//                         Icons.phone_android_outlined,
//                         color: AppColors.purple_icon,
//                       ),
//                     ),
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
//                     labelText: 'Quantity'.tr,
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(), // add padding to adjust icon
//                       child: Icon(
//                         Icons.production_quantity_limits_outlined,
//                         color: AppColors.purple_icon,
//                       ),
//                     ),
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
//                     return null; //controller.validatePrice(v!);
//                   },
//                   onSaved: (v) {
//                     controller.common_infoController != v;
//                   },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Common Info'.tr,
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(), // add padding to adjust icon
//                       child: Icon(
//                         Icons.info_outline_rounded,
//                         color: AppColors.purple_icon,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0.0),
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
//                   height: 60,
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                   child: RaisedButton(
//                     textColor: Colors.white,
//                     shape: StadiumBorder(side: BorderSide()),
//                     child: Text('Add'.tr),
//                     color: AppColors.purple_icon,
//                     onPressed: () {
//                       controller.insertProduct();
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
