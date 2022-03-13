import 'package:flutter/material.dart';
import 'package:test1/logic/Controllers/auth_controller.dart';
import 'package:test1/logic/Controllers/products_controller.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';


class Mainpage extends GetView<Product_Controller> {
  Mainpage({Key? key}) : super(key: key);
  Product_Controller controller = Get.find();
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'All Products',
                  icon: Icon(Icons.local_grocery_store_outlined),
                ),
                Tab(text: 'Add Product', icon: Icon(Icons.add)),
                Tab(
                    text: 'My products',
                    icon: Icon(Icons.store_mall_directory_outlined)),
              ],
            ),
            title: const Text('Main'),
          ),
          body: Center(
            child: const TabBarView(
              children: [
                //here call the screens
                //screen 1
                Text('ADD Products'),
                //screen Add products
                Text('ADD Products'),
                //screen my products
                Text('My Products'),
              ],
            ),
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Settings'),
                ),
                ListTile(
                  title: const Text('Language'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(' Contact Us',style: TextStyle(color: Color(0xDA00BBFF)),),
                  onTap: () {
                    Get.toNamed(AppRoutes.contactus);
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                  },
                ),
                ListTile(
                  title: const Text(' Log Out',style: TextStyle(color: Color(0xDA00BBFF)),),
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
        ),
      ),
    );
  }
}
