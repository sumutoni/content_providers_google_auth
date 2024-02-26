import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

ThemeData light = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white, titleTextStyle: TextStyle(color:Color.fromARGB(255, 47, 41, 107)), iconTheme: IconThemeData(color: Color.fromARGB(255, 27, 18, 61)),),
  
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Color.fromARGB(255, 47, 41, 107)),
    bodyText2: TextStyle(color: Color.fromARGB(255, 47, 41, 107)),
    subtitle1: TextStyle(color: Color.fromARGB(255, 47, 41, 107)),
    subtitle2: TextStyle(color: Color.fromARGB(255, 47, 41, 107)),

  ), 
  primaryColor: const Color.fromARGB(255, 47, 41, 107),
  listTileTheme: const ListTileThemeData(iconColor: Color.fromARGB(255, 47, 41, 107), textColor: Color.fromARGB(255, 47, 41, 107)),
  
);
ThemeData dark = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 27, 18, 61),
  appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 27, 18, 61), titleTextStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255)), iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255), weight: 30.0),),
  
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    bodyText2: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    subtitle1: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    subtitle2: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

  ),
  drawerTheme: const DrawerThemeData(backgroundColor: Color.fromARGB(255, 27, 18, 61),),
  primaryColor: const Color.fromARGB(255, 255, 255, 255),
  
  listTileTheme: const ListTileThemeData(iconColor: Color.fromARGB(255, 255, 255, 255), textColor: Color.fromARGB(255, 255, 255, 255)),
  

  
   
);

class ThemeController extends GetxController {
  late SharedPreferences _prefs;

  final RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPrefs();
  }

  void toggleTheme(bool isDark) {
    isDarkMode.value = isDark;
    _saveThemeToPrefs(isDark);
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _loadThemeFromPrefs() async {
    await _initPrefs();
    isDarkMode.value = _prefs.getBool('isDarkMode') ?? false;
  }

  void _saveThemeToPrefs(bool isDark) {
    _prefs.setBool('isDarkMode', isDark);
  }
}