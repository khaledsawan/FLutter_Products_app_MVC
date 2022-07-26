import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/widgets/icon_than_text/icon_than_text.dart';
import '../../../controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/theme/theme_service.dart';
import '../../../widgets/Custom_snackpar/show_custom_snackPar_red.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'Arabic', 'locale': Locale('ar', 'SY')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }



//ChangeLanguageAlertDialog Start
  ChangeLanguageAlertDialog(BuildContext context) {
// set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );
// set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text('Choose Your Language'),
      content: SizedBox(
          width: double.maxFinite,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Text(locale[index]!['Name'.tr]),
                    onTap: () {
                      updateLanguage(locale[index]!['locale'.tr]);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length)),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

//ChangeLanguageAlertDialog End
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          title: Text(
            'Setting'.tr,
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: AppColors.mainColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
                width: width - 17,
                height: height * 0.22,
                child: Image.asset('images/assets/settings.png')),
            SizedBox(
              height: height * 0.05,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                padding: const EdgeInsets.only(bottom: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon_Than_Text(
                            color: AppColors.mainColor,
                            icon: Icons.language_outlined,
                            text: 'language'.tr,
                          ),
                          GestureDetector(
                            onTap: () {
                              ChangeLanguageAlertDialog(context);
                            },
                            child: SizedBox(
                                width: 35,
                                height: 35,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 25,
                                  color: AppColors.gray400,
                                )),
                          )
                        ],
                      ),
                      Divider(
                        color: AppColors.textColor,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon_Than_Text(
                            color: AppColors.mainColor,
                            icon: Icons.dark_mode_outlined,
                            text: 'them mode'.tr,
                          ),
                          GestureDetector(
                            onTap: () {
                              ThemeService().switchTheme;
                              if (Get.isDarkMode) {
                                Get.changeThemeMode(ThemeMode.light);
                              } else {
                                Get.changeThemeMode(ThemeMode.dark);
                              }
                            },
                            child: SizedBox(
                                width: 35,
                                height: 35,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 25,
                                  color: AppColors.gray400,
                                )),
                          )
                        ],
                      ),
                      Divider(
                        color: AppColors.textColor,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
