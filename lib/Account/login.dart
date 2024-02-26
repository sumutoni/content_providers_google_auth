import 'package:content_providers_google_auth/Account/signup.dart';
import 'package:content_providers_google_auth/Firebase%20Authentication/authentication_service.dart';
import 'package:content_providers_google_auth/Pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/google_btn.dart';
import '../components/textfield.dart';
import '../home.dart';

class Login extends StatelessWidget {

  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final AuthenticationService auth = AuthenticationService();

  Login({super.key});

  void dispose(){
    passwordController.dispose();
    usernameController.dispose();
  }

  void login(BuildContext context) async{
    String email = usernameController.text.trim();
    String password = passwordController.text.trim();

    if(email.isEmpty && password.isEmpty){

    }
    else{
      Future<User?> user = auth.login(email, password);
      if (user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const Home();
        }));
    }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10.0,),
                // Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/logo.png',
                    height: 100.0,),
                  ],
                ),
                const SizedBox(height: 30.0,),
                const Text('HOMEIO', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, letterSpacing: 10.0),),
                //Welcome message
                const Text('Your home away from home!', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20.0,),
        
                //textfields, username, password
                MyTextFields(controller: usernameController,hintText: 'Email', obscureText: false, icon: const Icon(Icons.email)),
                const SizedBox(height: 15.0,),
                MyTextFields(controller: passwordController, hintText: 'Password', obscureText: true, icon: const Icon(Icons.lock)),
                const SizedBox(height: 15.0,),
        
                //forgot password
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right:20.0),
                      child: Text('Forgot Password', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    )],
                ),
                const SizedBox(height: 20.0,),
        
                //button
                MyButton(text:'Log in',onTap: ()=>login(context)
                ),
                const SizedBox(height: 30.0,),
        
                //or
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 20.0,
                        endIndent: 10.0,
                        thickness: 1.0,
                      )
                    ),
                    Text('Or', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Divider(
                        indent: 10.0,
                        endIndent: 20.0,
                        thickness: 1.0,
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 30.0,),
                //sign in with google
                const GoogleBtn(),
            
                // sign up if no account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text('Want to Join Us? ', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Signup();
                        }));
                      },
                      child: const Text('Sign up Here', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 107, 148, 238), decoration: TextDecoration.underline, decorationThickness: 2.0, decorationColor: Color.fromARGB(255, 107, 148, 238)),
                      )
                    ),
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}