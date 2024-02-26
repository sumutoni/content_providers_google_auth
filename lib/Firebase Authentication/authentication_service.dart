import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  FirebaseAuth authentication = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async{
    try{
      UserCredential credential = await authentication.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print(e);
    }
    return null;
  }

    Future<User?> signUp(String email, String password) async{
    try{
      UserCredential credential = await authentication.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print(e);
    }
    return null;
  }
}