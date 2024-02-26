import 'package:content_providers_google_auth/Account/login.dart';
import 'package:content_providers_google_auth/Controller/Image_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Controller/dependency_injection.dart';
import 'Themes/theme_injection.dart';
import 'package:get/get.dart';
import 'Themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar color to transparent
      statusBarIconBrightness: Brightness.dark, // Set status bar icons' color to dark
    ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  DependencyInjection.init();
  ThemeInjectcion.init();
  ImageInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final ThemeController themeController = Get.find();
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // themeMode: themeController.isDarkMode.value
      //     ? ThemeMode.dark
      //     : ThemeMode.light,
      theme: themeController.isDarkMode.value?dark:light,
      home: Login() ,
    ));

  }
}

