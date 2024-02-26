import 'package:content_providers_google_auth/Themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final ThemeController themeController = Get.find();

  Widget settingsItem(String text, String subtitle){
    return Material(
      color: const Color.fromARGB(0, 9, 36, 78),
      child: ListTile(
        contentPadding: const EdgeInsets.only(top:50.0, left: 30.0),
        selectedTileColor: const Color.fromARGB(146, 27, 11, 85),
        trailing:  Switch(
            value: themeController.isDarkMode.value,
            activeColor: const Color.fromARGB(255, 89, 74, 255),
            
            inactiveThumbColor: const Color.fromARGB(255, 47, 42, 95),
            inactiveTrackColor: const Color.fromARGB(255, 165, 160, 223),
            onChanged: (value){
              setState(() {
                themeController.toggleTheme(value);
              });
            }
          ),
        title: Text(text, style:  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style:  const TextStyle(fontSize: 15.0,)),
      ),
    );
  }

  Widget divider(){
    return Divider(
      indent: 30.0,
      endIndent: 30.0,
      height: 40.0,
      color: Theme.of(context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            settingsItem("Theme Preference", "Light or dark theme"),
            divider(),
          ],
        ),)
    );
  }
}