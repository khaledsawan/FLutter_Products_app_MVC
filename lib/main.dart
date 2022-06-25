import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:test1/routes/routes.dart';
import 'package:test1/utils/langs/translations.dart';

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
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        secondaryHeaderColor: Color(0xFF0A0E21),
        backgroundColor: Color(0xFF0A0E21),
        buttonColor: Color(0xFF550101),
        bottomAppBarColor: Color(0xFF7423A8),
        cardColor: Color(0xFF0D1D7F),
      ),
      translations: Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: AppRoutes.splashscreen,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
