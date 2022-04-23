import 'package:flutter/material.dart';
import 'package:test1/Database/model/product_model.dart';
import 'package:test1/logic/Controllers/auth%20controller/auth_controller.dart';
import 'package:test1/logic/Controllers/crud%20controller/products_controller.dart';
import 'package:test1/utils/colors/colors.dart';
import 'package:test1/views/screens/crud/product_detils.dart';
import 'package:get/get.dart';
import '../../../utils/langs/app_language.dart';
import '../../../routes/routes.dart';

class ProductsList extends GetView<ProductController> {
  ProductsList({Key? key}) : super(key: key);

  String query = '';
  ProductController controller = Get.find();
  AuthController authController = Get.find();
  String _selectedLang = 'en';

  @override
  Widget build(BuildContext context) {

    double widht = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.backGruond,
          title: Title(
            title: 'Title',
            color: Colors.white,
            child: Container(
              child: Text(
                'Product list'.tr,
                style: TextStyle(
                  fontSize: 20,
                  color:AppColors.blue,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Directionality(
                textDirection: _selectedLang == 'en'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<AppLanguage>(
                        init: AppLanguage(),
                        builder: (controllers) {
                          return DropdownButton(
                            dropdownColor: AppColors.purple_icon,
                            underline: SizedBox(
                              width: 70,
                            ),
                            icon: Container(

                              child: Icon(
                                Icons.language,
                                color: AppColors.blue,
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text("En",style:TextStyle(color: AppColors.blue,fontStyle: FontStyle.italic),),
                                value: 'en',
                              ),
                              DropdownMenuItem(
                                child: Text("Ar",style:TextStyle(color: AppColors.blue,fontStyle: FontStyle.italic),),
                                value: 'ar',
                              ),
                            ],
                            value: controllers.appLocale,
                            onChanged: (dynamic value) {
                              controllers.changeLanguage(value);
                              Get.updateLocale(Locale(value));
                            },
                          );
                        }),
                  ],
                ),
              ),
            ),
          ]),
      body: FutureBuilder<dynamic>(
        future: controller.get_demo_ProductsController(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            //  final items = snapshot.data as List<Product>;
            var items = snapshot.data as List<ProductMolde>;
            print(items);
            return Container(
              child: ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ProductDetils(itemproduct: items[index]));
                      },
                      child: Column(
                        children: [
                          Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: widht * 0.3,
                                    height: height * 0.15,
                                    padding: EdgeInsets.all(3),
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Image(
                                      image: NetworkImage(
                                          items[index].image.toString()),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(

                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              items[index].name.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                              alignment: Alignment.topLeft
                                          ),
                                          SizedBox(width: widht,height: height*0.07,
                                          child: Container(),),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(5,0,0,0),

                                                  child: Text(
                                                        items[index]
                                                            .category_id
                                                            .toString(),
                                                  ),
                                                ),
                                                Container(
                                                    child: Text("Price: " +
                                                        items[index].price.toString() +
                                                        "\$"),
                                                ),
                                                Row(
                                                  children: [
                                                  Container(
                                                    child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      child: Image(
                                                        image: AssetImage(
                                                            'images/assets/like_heart.png'),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(

                                                        right: 8,
                                                      ),
                                                    child: Text(
                                                      items[index]
                                                          .likes_count
                                                          .toString(),
                                                    ),
                                                  ),
                                                ],)

                                              ]),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: Drawer(
        backgroundColor: AppColors.backGruond,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.backGruond,
              ),
              child: Center(
                  child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                  color: AppColors.blue,
                ),
              )),
            ),
            ListTile(
              leading: Icon(Icons.paste_rounded,color: AppColors.blue,),
              title: Text(
                'My Products'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: AppColors.blue,
                ),
              ),
              onTap: () {
                // Update the state of the app
                Get.toNamed(AppRoutes.myproducts);
                // Then close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.vpn_lock_rounded,color: AppColors.blue,),
              title: Text(
                'Language'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: AppColors.blue,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle,color: AppColors.blue,),
              title: Text(
                'Contact Us'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: AppColors.blue,
                ),
              ),
              onTap: () {
                Get.toNamed(AppRoutes.contactus);
                // Update the state of the app
                // ...
                // Then close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.login,color: AppColors.blue,),
              title: Text(
                'Log Out'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: AppColors.blue,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                authController.DoLogout();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        onPressed: () => Get.toNamed(AppRoutes.addproduct,),
        child: const Icon(Icons.add,size: 30,),
      ),
    );
  }



}
