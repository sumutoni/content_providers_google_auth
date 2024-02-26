import 'dart:io';
import 'dart:ui';
import 'package:content_providers_google_auth/Controller/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class About extends StatefulWidget {

  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
   File? _image;
  ImageController imageController = Get.find();
  //checking gallery and camera permissions
  void getPermission() async{
    if (await Permission.storage.status.isDenied){
      Permission.storage.request();
    }
  }
  
  Widget modalContainer(Color? color){
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Change Profile', style: TextStyle(color: color,fontSize: 20.0, fontWeight: FontWeight.bold),),
          const SizedBox(height: 40.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){getImage(ImageSource.camera);},
                child: Column(
                  children: [
                    Icon(Icons.camera, color: color, size: 50.0,),
                    Text('Take Photo', style: TextStyle(color: color,fontSize: 15.0, fontWeight: FontWeight.bold),),
                  ],
                )
              ),
              GestureDetector(
                onTap: (){getImage(ImageSource.gallery);},
                child: Column(
                  children: [
                    Icon(Icons.photo, color: color, size: 50.0,),
                    Text('Choose from Gallery', style: TextStyle(color: color,fontSize: 15.0, fontWeight: FontWeight.bold),),
                  ],
                )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget drawerItem(String text, String subtext, IconData icon, IconData trailicon){
    return Container(
      margin: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left:20.0, right: 20.0),
        horizontalTitleGap: 30.0,
        leading: Icon(icon),
        trailing: Icon(trailicon),
        title: Text(text, style:  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        subtitle: Text(subtext, style: const TextStyle(fontSize: 20.0)),
      ),
    );
  }

  Widget sectionTitle(String title){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  Widget sectionInfo(String name, String value){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 16.0),),
          Text(value, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
          const Icon(Icons.arrow_right),
        ],
      ),
    );
  }

  //accessing gallery
  Future getImage(ImageSource source)async{
    getPermission();
   final image = await ImagePicker().pickImage(source: source, imageQuality: 100);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        imageController.setProfilePicPath(_image!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                   Stack(
                    children: [
                      CircleAvatar(
                        radius: 70.0,
                        backgroundImage: 
                        imageController.profilePicPathSet.value == true? 
                        FileImage(File(imageController.profilePicPath.value))
                        as ImageProvider
                        : const AssetImage('assets/images/profile.png'),
                      ),
                      Positioned(
                        right: 2.0,
                        top: 100.0,
                        child: CircleAvatar(
                          radius: 20.0,
                          child: FloatingActionButton(
                            onPressed: (){
                              showModalBottomSheet(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
                                context: context, 
                                builder: ((context){
                                  return modalContainer(Theme.of(context).scaffoldBackgroundColor);
                                }));
                            },
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Theme.of(context).scaffoldBackgroundColor,
                            tooltip: 'change picture',
                            child: const Icon(Icons.camera_alt_rounded),
                          ),
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height:10.0),
                  Text('Stephanie Umutoni', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            const Divider(
              height: 5.0,
              endIndent: 15.0,
              indent: 15.0,
              thickness: 2.0,
            ),
            sectionTitle('Personal Information'),
            const SizedBox(height: 5.0,),
            sectionInfo("Names", "Jane Smith"),
            const SizedBox(height: 20.0,),
            sectionInfo('Phone', '0793546728'),
            const SizedBox(height: 20.0,),
            sectionInfo('Email', 'steumutoni@gmail.com'),
            const SizedBox(height: 20.0,),
            const Divider(
              height: 5.0,
              endIndent: 15.0,
              indent: 15.0,
              thickness: 2.0,
            ),
            sectionTitle('User Profile'),
            const SizedBox(height: 5.0,),
            sectionInfo("Profile name", "Jane Smith"),
            const SizedBox(height: 20.0,),
            sectionInfo('Username', 'JSmith'),
        
          ]
        ),
      ),
    );
  }
}