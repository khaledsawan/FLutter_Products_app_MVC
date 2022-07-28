import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:test1/controller/auth_controller.dart';
import 'package:test1/controller/products_controller.dart';
import 'package:test1/utils/colors/colors.dart';
import 'package:test1/views/screens/crud/my_products_page.dart';
import 'package:test1/widgets/icon_than_text/icon_than_text.dart';
import 'package:test1/widgets/text/big_text.dart';
import '../../../routes/routes.dart';
import '../crud/add_product_page.dart';
import '../crud/product_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PersistentTabController _controller;
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    Get.find<ProductController>().getMyProduct();
    Get.find<AuthController>().getProfileInfo();
    _controller = PersistentTabController(initialIndex: 2);
  }

  List<Widget> _buildScreens(ProductController productController) {
    return [
       MyProductsPage(productController),
       AddProductPage(productController),
       ProductsListPage(productController),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.list_bullet),
        title: ("My Product"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.yellowColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.add_circled,
          size: 40,
        ),
        title: ("ADD Product".tr),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.yellowColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home".tr),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.yellowColor,
      ),
    ];
  }

  String title(int index) {
    String title = '';
    setState(() {
      index = _controller.index;
      if (index == 2) {
        title = 'Product'.tr;
      } else if (index == 1) {
        title = 'add Product'.tr;
      } else if (index == 0) {
        title = 'My Product'.tr;
      }
    });
    return title;
  }

  Future<void> _loadResourses() async {
    await Get.find<ProductController>().getMyProduct();
    await Get.find<ProductController>().getProductList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int indexSelected = 0;
    AppBar appBar = AppBar(
      backgroundColor: AppColors.mainColor,
      title: Text(title(indexSelected)),
    );
    double appbarheight = appBar.preferredSize.height;
    return RefreshIndicator(
      displacement: height * 0.05,
      onRefresh: _loadResourses,
      child: Scaffold(
        key: globalKey,
        drawer: GetBuilder<AuthController>(builder: (controller) {
          return controller.isloading
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ))
              : Drawer(
                  backgroundColor: AppColors.mainColor,
                  width: width * 0.6,
                  child: Column(
                    children: [
                      SizedBox(
                        height: appbarheight,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: width * 0.182,
                          backgroundColor: AppColors.gray800,
                          child: CircleAvatar(
                            radius: width * 0.175,
                            backgroundColor: AppColors.backGroundColor,
                            backgroundImage:
                                AssetImage('images/assets/pob.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BigText(
                        textbody: controller.profileInfoModel.user!.name!,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width * 0.6,
                          height: 30,
                          child: Icon_Than_Text(
                              icon: Icons.person_outline,
                              text: 'Profile'.tr,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.settingpage);
                        },
                        child: Container(
                          width: width * 0.6,
                          height: 30,
                          color: AppColors.mainColor,
                          child: Icon_Than_Text(
                              icon: Icons.settings_outlined,
                              text: 'Setting'.tr,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.contactus);
                        },
                        child: Container(
                          width: width * 0.6,
                          height: 30,
                          color: AppColors.mainColor,
                          child: Icon_Than_Text(
                              icon: Icons.group_outlined,
                              text: 'Contact Us'.tr,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Get.find<AuthController>().clearUserAuth();
                          SystemNavigator.pop();
                        },
                        child: Container(
                          width: width * 0.6,
                          height: 30,
                          color: AppColors.mainColor,
                          child: Icon_Than_Text(
                              icon: Icons.login_outlined,
                              text: 'logout'.tr,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                );
        }),
        appBar: appBar,
        body: GetBuilder<ProductController>(builder:(productController){
          return PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(productController),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(10.0),
                colorBehindNavBar: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.yellowColor,
                    offset: const Offset(
                      0.1,
                      0.1,
                    ),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  )
                ]),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            onItemSelected: (index) {
              print(index);
              indexSelected = index;
              setState(() {
                title(index);
              });
            },
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style12, // Choose the nav bar style with this property.
          );
        },),
      ),
    );
  }
}
