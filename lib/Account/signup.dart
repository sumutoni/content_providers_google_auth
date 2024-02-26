import 'package:content_providers_google_auth/Account/login.dart';
import 'package:content_providers_google_auth/Firebase%20Authentication/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/google_btn.dart';
import '../components/textfield.dart';
import '../home.dart';

class Signup extends StatelessWidget {

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final AuthenticationService auth = AuthenticationService();

  Signup({super.key});

  void dispose(){
    passwordController.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  void signup(BuildContext context) async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email.isEmpty && password.isEmpty){

    }
    else{
      Future<User?> user = auth.signUp(email, password);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Login();
      }));
      
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
                const SizedBox(height: 15.0,),
                const Text('HOMEIO', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, letterSpacing: 10.0),),
                //Welcome message
                const Text('Your home away from home!', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 30.0,),
        
                //textfields, username, password
                MyTextFields(controller: nameController,hintText: 'Names', obscureText: false, icon: const Icon(Icons.person),),
                const SizedBox(height: 15.0,),
                MyTextFields(controller: emailController,hintText: 'Email', obscureText: false, icon: const Icon(Icons.email)),
                const SizedBox(height: 15.0,),
                MyTextFields(controller: passwordController, hintText: 'Password', obscureText: true,icon: const Icon(Icons.lock)),
                const SizedBox(height: 15.0,),
                const SizedBox(height: 20.0,),
        
                //button
                MyButton(text:'Sign up', onTap: ()=>signup(context)),
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
                    const Text('Already a member? ', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Login();
                        }));
                      },
                      child: const Text('Login here', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 107, 148, 238), decoration: TextDecoration.underline, decorationThickness: 2.0, decorationColor: Color.fromARGB(255, 107, 148, 238)),
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