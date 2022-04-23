import 'package:get/get.dart';
import 'package:test1/logic/bindings/auth_binding.dart';
import 'package:test1/logic/bindings/login_binding.dart';
import 'package:test1/logic/bindings/products_binding.dart';
import 'package:test1/logic/bindings/register_binding.dart';
import 'package:test1/views/screens/crud/product_list.dart';
import 'package:test1/views/screens/auth/login.dart';
import 'package:test1/views/screens/auth/signup.dart';
import 'package:test1/views/screens/splach%20screen/splash_screen.dart';
import 'package:test1/views/screens/home/main_page.dart';
import 'package:test1/views/screens/crud/add_product.dart';
import 'package:test1/logic/bindings/insertproduct_binding.dart';
import 'package:test1/views/screens/crud/my_products.dart';
import 'package:test1/views/screens/crud/edit_produtct.dart';
import '../views/screens/home/contact_us.dart';

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
        page: () => ProductsList(), transition: Transition.fadeIn,
        binding: ProductBinding()),

    GetPage(
        name: Routes.myproducts,
        page: () => MyProducts(), transition: Transition.fadeIn,
        binding: ProductBinding()),

    //GetPage(name: Routes.productDetails , page: () =>  ProductDetils(itemproduct: null,)),
    GetPage(
      name: Routes.mainpage,
      page: () => Mainpage(),
  transition: Transition.fadeIn,
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.contactus,
  transition: Transition.fadeIn,
      page: () => ContactUs(),
    ),
    GetPage(
        name: Routes.addproduct,
        page: () => AddProduct(),
  transition: Transition.fadeIn,
        binding: InsertProductBinding()),

    GetPage(
        name: Routes.products,
        page: () => ProductsList(),
        binding: ProductBinding(),
    transition: Transition.fadeIn),
    GetPage(
        name: Routes.editproduct,
        page: () => EditProduct(),
  transition: Transition.fadeIn,
        binding: InsertProductBinding()),

    GetPage(
        name: Routes.signup, page: () => Signup(), binding: RegisterBinding(), transition: Transition.fadeIn),
    GetPage(name: Routes.login, page: () => Login(), binding: LoginBinding(), transition: Transition.fadeIn),
    GetPage(
        name: Routes.splashscreen,
  transition: Transition.fadeIn,
        page: () => SplachScreen(),
        binding: AuthBinding()),
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
