import 'package:content_providers_google_auth/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({
    super.key});


  _signInAuth(BuildContext context) async{
    final GoogleSignIn _signIn = GoogleSignIn();
    try{
      final GoogleSignInAccount? account = await _signIn.signIn();
      if (account != null){
        final GoogleSignInAuthentication authentication = await account.authentication;

        final AuthCredential accountCredentials = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken
        );
        await FirebaseAuth.instance.signInWithCredential(accountCredentials);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _signInAuth(context),
      child: Container(
        height: 70.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 47, 41, 107),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Row(
          children:  [
            Image.asset('assets/images/google.png', 
              height: 90.0,),
          const Text('Continue with Google', style: TextStyle(color: Colors.white,fontSize: 16.0, fontWeight: FontWeight.bold),),
          ]
        ),
      ),
    );
  }
}