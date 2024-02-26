import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {

  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactState();
}

class _ContactState extends State<Contacts> {
  List<Contact>? contacts;

  @override
  void initState(){
    super.initState();
    getContacts();
  }

  void getContacts() async{
    if (await FlutterContacts.requestPermission()){
      contacts  = (await FlutterContacts.getContacts(
      withProperties: true, withPhoto: true)).cast<Contact>();
      setState(() {
        
      });
    }
    
  }

  Widget contactItem(int index, Uint8List? img){
    return Material(
      color: const Color.fromARGB(0, 9, 36, 78),
      child: ListTile(
        contentPadding: const EdgeInsets.only(top:50.0, left: 30.0),
        selectedTileColor: const Color.fromARGB(146, 27, 11, 85),
        trailing: GestureDetector(
          onTap: (){
            launch('tel:${contacts![index].phones[0].number}');
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Icon(Icons.phone),
          )
        ),
        leading: img == null?
        const CircleAvatar(
          child: Icon(Icons.person),
        ):
        CircleAvatar(
          backgroundImage: MemoryImage(img),
        ),
        title:  Text("${contacts![index].name.first} ${contacts![index].name.last}", style:  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        subtitle: Text(contacts![index].phones[0].number, style: const TextStyle(fontSize: 15.0,)),
      ),
    );
  }

  Widget divider(BuildContext context){
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
      body: contacts == null?
        const Center(
          child: Text('No Contacts', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
        ):
        ListView.builder(
          itemCount: contacts!.length,
          itemBuilder: (BuildContext context, int index){
            Uint8List? img = contacts![index].photo;
            return contactItem(index, img);
          }
        )
    );
  }
}