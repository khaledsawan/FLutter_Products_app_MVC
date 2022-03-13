import 'package:flutter/material.dart';
import 'package:test1/Database/model/product.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';
import 'package:test1/logic/Controllers/products_controller.dart';
import 'package:test1/views/screens/ProductDetils.dart';
import 'package:get/get.dart';
import '../../logic/Controllers/app_language.dart';
import '../../routes/routes.dart';

class productlist extends GetView<Product_Controller> {
  productlist({Key? key}) : super(key: key);
  String query = '';
  Product_Controller controller = Get.find();
  AuthController authController = Get.find();
  String _selectedLang = 'en';
  @override
  Widget build(BuildContext context) {

    double widht = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF111631),
          title: Title(
            title: 'Title',
            color: Colors.white,
            child: Container(
              child: Text(
                'Product list'.tr,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xDA00BBFF),
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
                            dropdownColor: Color(0xDA00BBFF),
                            underline: SizedBox(
                              width: 70,
                            ),
                            icon: Container(
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.language,
                                color: Color(0xDA00BBFF),
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text("En",style:TextStyle(color: Color(0xDA00BBFF),fontStyle: FontStyle.italic),),
                                value: 'en',
                              ),
                              DropdownMenuItem(
                                child: Text("Ar",style:TextStyle(color: Color(0xDA00BBFF),fontStyle: FontStyle.italic),),
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
              /*leading: IconButton(
          icon: Icon(Icons.search_outlined),
          //onPressed:() => Navigator.pop(context, false),
          onPressed: () => Navigator.pop(context),
        ),*/
            ),
          ]),
      body: FutureBuilder<dynamic>(
        future: controller.get_demo_ProductsController(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            //  final items = snapshot.data as List<Product>;
            var items = snapshot.data as List<Product>;
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
                                    height: hight * 0.15,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              items[index].name.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(5,5,15,5),
                                                  padding: EdgeInsets.only(
                                                      left: 8, top: 4),
                                                  child: Text(
                                                    "Category: " +
                                                        items[index]
                                                            .category_id
                                                            .toString(),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 8, top: 4),
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
                                                      left: 4,
                                                      right: 8,
                                                      top: 5),
                                                  child: Text(
                                                    items[index]
                                                        .likes_count
                                                        .toString(),
                                                  ),
                                                ),
                                              ]),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, right: 8, top: 6),
                                              child: Text("Price: " +
                                                  items[index].price.toString() +
                                                  "\$"),
                                            ),
                                          ),
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

        backgroundColor: Color(0xFF0A0E21),
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0A0E21),
              ),
              child: Center(
                  child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                  color: Color(0xDA00BBFF),
                ),
              )),
            ),
            ListTile(
              leading: Icon(Icons.paste_rounded,color: Color(0xDA00BBFF),),
              title: Text(
                'My Products'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color(0xDA00BBFF),
                ),
              ),
              onTap: () {
                // Update the state of the app
                Get.toNamed(AppRoutes.myproducts);
                // Then close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.vpn_lock_rounded,color: Color(0xDA00BBFF),),
              title: Text(
                'Language'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color(0xDA00BBFF),
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle,color: Color(0xDA00BBFF),),
              title: Text(
                'Contact Us'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color(0xDA00BBFF),
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
              leading: Icon(Icons.login,color: Color(0xDA00BBFF),),
              title: Text(
                'Log Out'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color(0xDA00BBFF),
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
        backgroundColor: Color(0xFF7423A8),
        onPressed: () => Get.toNamed(AppRoutes.addproduct,),
        child: const Icon(Icons.add),
      ),
    );
  }



}
