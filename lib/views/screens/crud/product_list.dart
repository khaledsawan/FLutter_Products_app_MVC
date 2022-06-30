import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/views/screens/crud/index_page.dart';

import '../../../service/model/product_model.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors/colors.dart';
import '../../../widgets/text/smail_text.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
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
        return GestureDetector(
          onTap: (){
            Get.to(IndexPage());
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: AppColors.backGroundColor),
            height: height * 0.38,
            margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            padding: EdgeInsets.all(4),
            child: Stack(
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
                          border: Border.all(width: 1, color: AppColors.gray800),
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
                            image: AssetImage('images/assets/blue_cart.png'),
                          )),
                    ),
                  ),
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
                          BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
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
          ),
        );
      },
    ));
  }
}
