import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/homeo.png',)
              ),
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),),
              padding: const EdgeInsets.all(15.0),
              child: const Text('Welcome  to  Homieo',style: TextStyle(fontSize: 31.0, fontWeight: FontWeight.bold,fontFamily:'Comfortaa')))
          ],
        )
        )
      );
  }
}