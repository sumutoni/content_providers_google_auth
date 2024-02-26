import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({
    super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(horizontal: 70.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 47, 41, 107),
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Center(
          child:  Text(text, style: const TextStyle(color: Colors.white, fontSize: 20.0),)
        ),
      ),
    );
  }
}