import 'package:flutter/material.dart';

class MyTextFields extends StatelessWidget {
  final controller;
  final bool obscureText;
  final String hintText;
  final Widget icon;

  const MyTextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(20.0),
        child: TextField(
          style: const TextStyle(fontSize: 20.0),
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: icon,
            // enabledBorder: OutlineInputBorder(
            //   borderSide: const BorderSide(color:Color.fromARGB(255, 220, 217, 226)),
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: const BorderSide(color: Color.fromARGB(255, 27, 18, 61), width: 2.0),
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
            // fillColor: const Color.fromARGB(255, 220, 217, 226),
            // filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).primaryColor),
          ),
          obscureText: obscureText,
        )
      ),
    );
  }
}