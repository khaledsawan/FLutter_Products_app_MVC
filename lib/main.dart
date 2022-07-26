import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:test1/routes/routes.dart';
import 'package:test1/utils/langs/translations.dart';
import 'package:test1/utils/localeString.dart';
import 'package:test1/views/screens/auth/sign_in_page.dart';
import 'package:test1/views/screens/auth/sign_up_page.dart';
import 'package:test1/views/screens/crud/product_details_page.dart';
import 'package:test1/views/screens/how%20we%20are/contact_us.dart';
import 'package:test1/views/screens/splach_screen/splash_screen.dart';
import 'init/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF60EE19),
        scaffoldBackgroundColor: Color(0xFFFDFFFA),
        secondaryHeaderColor: Color(0xFFBFECAB),
        backgroundColor: Color(0xFFD5F6E3),
        buttonColor: Color(0xFFE4F6E1),
        bottomAppBarColor: Color(0xFF282C28),
        cardColor: Color(0xFF46EFC3),
      ),
      locale: const Locale('gu', 'IN'),
      translations: LocaleString(),
      fallbackLocale: const Locale('en', 'US'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //home: SignUpPage(),
       initialRoute: AppRoutes.splashscreen,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
////////////////////////////////////////////////
