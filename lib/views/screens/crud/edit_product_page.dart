import 'package:flutter/material.dart';
import '../../../utils/colors/colors.dart';
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

  // List of items in our dropdown menu
  var items = [
    'food',
    'FrontEnd',
    'BackEnd',
    'fullStack',
    'webbed',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    quantityController.text = '10';
    priceController.text = '102';
    locationController.text = 'Syria damascus muzzi ';
    descriptionController.text =
        'just long text with some help and more , i need to put more fekjbhjkhjkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfekjbhjkhjkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfekjbhjkhjkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfekjbhjkhjkjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaturehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaturehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaturehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhature application in this time i don\'t know what i am write hare and try onw more time  ';

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Text(
          'name',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                // margin: EdgeInsets.only(top: 15),
                width: width,
                height: height * 0.45,
                child: Stack(
                  children: [
                    Positioned(
                        width: width,
                        height: height * 0.45,
                        child: Image(
                          image: AssetImage('images/assets/pob.jpg'),
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
                                textbody: '54',
                                color: AppColors.blue,
                              ),
                            ],
                          ),
                        ))
                  ],
                )),
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
              child: InputTextForm(
                  icon: Icons.production_quantity_limits,
                  hintcolor: AppColors.blue,
                  hintText: 'Quantity',
                  color: AppColors.red,
                  textInputType: TextInputType.number,
                  textEditingController: quantityController),
            ),
            Container(
              child: InputTextForm(
                  icon: Icons.price_change_outlined,
                  hintcolor: AppColors.blue,
                  hintText: 'Price',
                  color: AppColors.titleColor,
                  textInputType: TextInputType.number,
                  textEditingController: priceController),
            ),
            Container(
              child: InputTextForm(
                  icon: Icons.location_on,
                  hintcolor: AppColors.blue,
                  hintText: 'location',
                  color: AppColors.titleColor,
                  textInputType: TextInputType.text,
                  textEditingController: locationController),
            ),
            Container(
              child: InputTextForm(
                  icon: Icons.details,
                  hintcolor: AppColors.blue,
                  hintText: 'description',
                  height: height * 0.25,
                  color: AppColors.titleColor,
                  textInputType: TextInputType.text,
                  textEditingController: descriptionController),
            ),
            SizedBox(
              height: height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
