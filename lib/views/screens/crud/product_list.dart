import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: ListView.builder(
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(  borderRadius: BorderRadius.circular(30),
          color: Colors.white),
          height: height*0.33,
          margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
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
                    margin: const EdgeInsets.only( bottom:50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
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
                  height: 105,
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
                        Text('name'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                      (index) => const Icon(Icons.star,
                                      color: Colors.cyan, size: 15)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SmailText(
                                maxline: 1,
                                textbody: '5',
                                color: AppColors.textColor),
                            const SizedBox(
                              width: 10,
                            ),
                            SmailText(
                                maxline: 1,
                                textbody: "1287 comments",
                                color: AppColors.textColor)
                          ],
                        ),
                        const SizedBox(
                          height: 25,
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
