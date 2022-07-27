import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/controller/products_controller.dart';
import 'package:test1/service/model/product_id_model.dart';
import 'package:test1/service/model/update_product_model.dart';
import '../../../routes/routes.dart';
import '../../../service/model/product_model.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors/colors.dart';
import '../../../widgets/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../widgets/inputtextform/inputtextform.dart';
import '../../../widgets/text/smail_text.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({Key? key}) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String dropdownvalue = 'food';

  var items = [
    'food',
    'FrontEnd',
    'BackEnd',
    'fullStack',
    'webbed',
  ];

  updateValue(Product product) {
    dropdownvalue = product.item!.category!;
    quantityController.text = product.item!.quantity!.toString();
    priceController.text = product.item!.price!.toString();
    locationController.text = product.item!.location!.toString();
    descriptionController.text = product.item!.descirption!.toString();
  }

  @override
  void initState() {
    super.initState();
    updateValue(Get.find<ProductController>().ItemProduct);
  }

  updateProduct(ProductController controller) async {
    String quantity = quantityController.text.trim();
    String price = priceController.text.trim();
    String location = locationController.text.trim();
    String description = descriptionController.text.trim();
    if (quantity.isEmpty) {
      ShowCustomSnackparRed('enter quantity', 'quantity is empty');
    } else if (!GetUtils.isNum(quantity)) {
      ShowCustomSnackparRed('not Number', 'The quantity must be numbers only');
    } else if (price.isEmpty) {
      ShowCustomSnackparRed('enter price', 'price is empty');
    } else if (!GetUtils.isNum(price)) {
      ShowCustomSnackparRed('not number', 'The price must be numbers only');
    } else if (location.isEmpty) {
      ShowCustomSnackparRed('enter location', 'location is empty');
    } else if (location.length < 3) {
      ShowCustomSnackparRed(
          'short location must more than 3 characters', 'short location');
    } else if (description.length < 6) {
      ShowCustomSnackparRed(
          'short description must more than 6 characters', 'short description');
    } else {
      UpdateProductModel updateProductModel = UpdateProductModel(
          controller.ItemProduct.item!.id!,
          dropdownvalue,
          location,
          double.parse(price),
          int.parse(quantity),
          description);
      await controller.update_product(updateProductModel).then((status) async {
        if (status.isSuccessful!) {
          print('Update Product is done');
          await Get.find<ProductController>().getMyProduct();
          await Get.find<ProductController>().getProductList();
         // await Get.find<ProductController>().show_product(ProductId(id: controller.ItemProduct.item!.id!));
          await Get.toNamed(AppRoutes.mainpage);
          // controller
          //     .show_product(ProductId(id: Get.find<ProductController>().ItemProduct.item!.id!))
          //     .then((value) => (status) {
          //           if (status.isSuccessful!) {
          //             print('show Product is done');
          //             Get.toNamed(AppRoutes.productDetails);
          //           } else {
          //             ShowCustomSnackparRed(
          //                 status.massage.toString() + '', 'error');
          //           }
          //         });
        } else {
          ShowCustomSnackparRed(
              status.massage.toString() + 'check your internet connection',
              'error');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GetBuilder<ProductController>(builder: (controller) {
      return controller.isLoaded
          ? Center(
              child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ))
          : Scaffold(
              backgroundColor: AppColors.backGroundColor,
              appBar: AppBar(
                title: Text(
                  controller.ItemProduct.item!.name!,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: AppColors.mainColor,
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        // margin: EdgeInsets.only(top: 15),
                        width: width,
                        height: height * 0.45,
                        child: Stack(
                          children: [
                            Positioned(
                                width: width,
                                height: height * 0.42,
                                child: Image(
                                  image: NetworkImage(AppConstants.BASE_URL +
                                      '/public/Image/' +
                                      controller.ItemProduct.item!.image!),
                                  fit: BoxFit.fill,
                                )),
                            Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  margin: EdgeInsets.all(4),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye,
                                        color: AppColors.gray400,
                                      ),
                                      SmailText(
                                        textbody: controller
                                            .ItemProduct.item!.view!
                                            .toString(),
                                        color: AppColors.blue,
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        )),
                    Container(
                      color: AppColors.backGroundColor,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            // Initial Value
                            dropdownColor: AppColors.backGroundColor,
                            value: dropdownvalue,
                            // Down Arrow Icon
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.blue,
                              size: 30,
                            ),
                            iconSize: 30,
                            underline: Container(
                              color: AppColors.blue,
                              width: 1,
                            ),
                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Container(
                                    color: AppColors.backGroundColor,
                                    alignment: Alignment.center,
                                    width: width * 0.3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // Container(padding: EdgeInsets.only(bottom:8),child: Icon(Icons.arrow_drop_down,size: 40,color: AppColors.blue,)),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          items,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.titleColor,
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.35,
                      height: 1,
                      color: AppColors.gray400,
                      margin: EdgeInsets.only(bottom: 2, left: 10, right: 10),
                    ),
                    Container(
                      child: InputTextForm(
                          icon: Icons.production_quantity_limits,
                          hintcolor: AppColors.blue,
                          hintText: 'Quantity'.tr,
                          color: AppColors.red,
                          textInputType: TextInputType.number,
                          textEditingController: quantityController),
                    ),
                    Container(
                      child: InputTextForm(
                          icon: Icons.price_change_outlined,
                          hintcolor: AppColors.blue,
                          hintText: 'Price'.tr,
                          color: AppColors.titleColor,
                          textInputType: TextInputType.number,
                          textEditingController: priceController),
                    ),
                    Container(
                      child: InputTextForm(
                          icon: Icons.location_on,
                          hintcolor: AppColors.blue,
                          hintText: 'location'.tr,
                          color: AppColors.titleColor,
                          textInputType: TextInputType.text,
                          textEditingController: locationController),
                    ),
                    Container(
                      child: InputTextForm(
                          icon: Icons.details,
                          hintcolor: AppColors.blue,
                          hintText: 'description'.tr,
                          height: height * 0.25,
                          color: AppColors.titleColor,
                          textInputType: TextInputType.text,
                          textEditingController: descriptionController),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        updateProduct(controller);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width * 0.35,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                            child: Text(
                          'Update'.tr,
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
