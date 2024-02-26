import 'dart:io';

import 'package:content_providers_google_auth/Account/login.dart';
import 'package:content_providers_google_auth/Pages/Contact.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Controller/image_controller.dart';
import 'Pages/about.dart';
import 'Pages/calculator.dart';
import 'Pages/home_page.dart';
import 'Pages/settings.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  ImageController imageController = Get.find();
  void navigatePages(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  Widget displayPage(int index){
    if (index == 0){
      return const HomeTab();
    }
    else if(index == 1){
      return const Contacts();
    }
    else if (index == 2){
      return const About();
    }
    else if (index == 3){
      return const Settings();
    }
    else{
      return const Calculator();
    }
  }

  Widget drawerItem(int index, String text, IconData icon, bool isSelected){
    return Material(
      color: const Color.fromARGB(0, 9, 36, 78),
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Theme.of(context).primaryColor,
        leading: Icon(icon, color: isSelected?Theme.of(context).scaffoldBackgroundColor:Theme.of(context).primaryColor),
        title: Text(text, style:  TextStyle(color: isSelected?Theme.of(context).scaffoldBackgroundColor:Theme.of(context).primaryColor, fontSize: 20.0)),
        onTap: () {
          navigatePages(index);
          Navigator.pop(context);
          
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: const Text(
          'H O M I E O',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: ()async {
            await FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login()),
        );
          }, icon: const Icon(Icons.logout) )
        ],
      ),
      drawer: Drawer(
        
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Theme.of(context).drawerTheme.backgroundColor),
                child:  Center(
                  child: Image.asset('assets/images/logo.png',
                    height: 100.0,),
                ),
              ),
            drawerItem(0, 'H o m e', Icons.home, selectedIndex == 0),
            drawerItem(4, 'C a l c u l a t o r', Icons.calculate_outlined, selectedIndex == 4),
            drawerItem(2, 'A b o u t  m e', Icons.person, selectedIndex == 2),
          ],
          ),
      ),
      body: displayPage(selectedIndex),
      bottomNavigationBar: GNav(
        tabMargin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        gap: 8.0,
        selectedIndex: selectedIndex,
        onTabChange: (index){
          navigatePages(index);
        },
        color: Theme.of(context).primaryColor,
        tabBackgroundColor: Theme.of(context).primaryColor,
        activeColor: Theme.of(context).scaffoldBackgroundColor,
        // index: selectedIndex,
        // onTap: navigatePages,
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon:Icons.contact_phone, text: 'Contacts',),
          GButton(icon: Icons.person, text: 'Profile',),
          GButton(icon: Icons.settings, text: 'Settings',)
        ])
    );
  }
}