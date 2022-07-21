import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test1/utils/colors/colors.dart';
import 'package:test1/widgets/inputtextform/inputtextform.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? image;
  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  String dropdownvalue = 'food';

  // List of items in our dropdown menu
  var items = [
    'food',
    'FrontEnd',
    'BackEnd',
    'fullStack',
    'webbed',
  ];

  @override
  void initState() {
    super.initState();
    print('init ');
    quantityController.text = '10';
    priceController.text = '102';
    nameController.text = 'name';
    locationController.text = 'Syria damascus muzzi ';
    descriptionController.text =
        'just long text with some help and more , i need to put more fekjbhjkhjkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfekjbhjkhjkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfekjbhjkhjkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfekjbhjkhjkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaturehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaturehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaturehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhature application in this time i don\'t know what i am write hare and try onw more time  ';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              image.isNull
                  ? GestureDetector(
                      onTap: () {
                        //pickup image
                        pickImageGallery();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: AppColors.gray400),
                          // image: DecorationImage(
                          //     image: AssetImage('images/assets/pob.jpg'),
                          //     fit: BoxFit.fill),
                        ),
                        width: width,
                        height: height * 0.33,
                        child: Center(
                            child: Icon(
                          Icons.add_a_photo,
                          color: AppColors.gray400,
                          size: 100,
                        )),
                      ),
                    )
                  : Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: AppColors.gray400),
                            image: DecorationImage(
                                image: FileImage(image!), fit: BoxFit.fill),
                          ),
                          width: width,
                          height: height * 0.33,
                        ),
                        Positioned(
                            left: width - 50,
                            top: 20,
                            child: GestureDetector(
                              onTap: () {
                                //delete the image => image= null;
                                setState(() {
                                  image = null;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.close,
                                      size: 35,
                                      color: AppColors.gray400,
                                    ),
                                  ),
                                  Text(
                                    'remove'.tr,
                                    style: TextStyle(
                                        color: AppColors.gray400, fontSize: 12),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
              Container(
                color: AppColors.backGroundColor,
                margin: EdgeInsets.only(left: 8, right: 8, top: 8),
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                margin: EdgeInsets.only(top: 0, left: 10, right: 10),
              ),
              Container(
                child: InputTextForm(
                    icon: Icons.near_me,
                    hintcolor: AppColors.blue,
                    hintText: 'Name'.tr,
                    color: AppColors.titleColor,
                    textInputType: TextInputType.text,
                    textEditingController: nameController),
              ),
              Container(
                child: InputTextForm(
                    icon: Icons.production_quantity_limits,
                    hintcolor: AppColors.blue,
                    hintText: 'Quantity'.tr,
                    color: AppColors.titleColor,
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
              Container(
                width: width * 0.35,
                height: height * 0.08,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Center(
                    child: Text(
                  'Add'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 26),
                )),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ));
  }
}
