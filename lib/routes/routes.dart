import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test1/logic/bindings/auth_binding.dart';
import 'package:test1/logic/bindings/login_binding.dart';
import 'package:test1/logic/bindings/products_binding.dart';
import 'package:test1/logic/bindings/register_binding.dart';
import 'package:test1/views/screens/productlist.dart';
import 'package:test1/views/screens/auth/login.dart';
import 'package:test1/views/screens/auth/signup.dart';
import 'package:test1/views/screens/splashscreen.dart';
import 'package:test1/views/screens/mainpage.dart';
import 'package:test1/views/screens/addproduct.dart';
import 'package:test1/logic/bindings/insertproduct_binding.dart';
import 'package:test1/views/screens/MyProducts.dart';
import 'package:test1/views/screens/editprodutct.dart';
import '../views/screens/ContactUs.dart';

class AppRoutes {
  static const addproduct = Routes.addproduct;
  static const editproduct = Routes.editproduct;
  static const myproducts = Routes.myproducts;
  static const contactus = Routes.contactus;
  static const products = Routes.products;
  static const mainpage = Routes.mainpage;
  static const productDetails = Routes.productDetails;
  static const insertProduct = Routes.insertProduct;
  static const signup = Routes.signup;
  static const login = Routes.login;
  static const splashscreen = Routes.splashscreen;

  static final routes = [
    GetPage(
        name: Routes.products,
        page: () => productlist(),
        binding: Product_Binding()),

    GetPage(
        name: Routes.myproducts,
        page: () => MyProducts(),
        binding: Product_Binding()),

    //GetPage(name: Routes.productDetails , page: () =>  ProductDetils(itemproduct: null,)),
    GetPage(
      name: Routes.mainpage,
      page: () => Mainpage(),
      binding: Auth_Binding(),
    ),

    GetPage(
      name: Routes.contactus,
      page: () => ContactUs(),
    ),
    GetPage(
        name: Routes.addproduct,
        page: () => AddProduct(),
        binding: insert_Product_binding()),

    GetPage(
        name: Routes.editproduct,
        page: () => EditProduct(),
        binding: insert_Product_binding()),

    GetPage(
        name: Routes.signup, page: () => Signup(), binding: Register_Binding()),
    GetPage(name: Routes.login, page: () => Login(), binding: Login_Binding()),
    GetPage(
        name: Routes.splashscreen,
        page: () => SplashScreen(),
        binding: Auth_Binding()),
  ];
}

class Routes {
  static const editproduct = '/editproduct';
  static const myproducts = '/myproducts';
  static const addproduct = '/addproduct';
  static const contactus = '/contactus';
  static const products = '/products';
  static const mainpage = '/mainpage';
  static const productDetails = '/product_details';
  static const insertProduct = '/insert_product';
  static const signup = '/signup';
  static const login = '/login';
  static const splashscreen = '/splashscreen';
}
