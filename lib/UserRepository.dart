import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  FirebaseAuth firebaseAuth;
  GoogleSignIn googleSignIn;

  //constructor
  UserRepository(
      { required this.firebaseAuth,  required this.googleSignIn})
     ;

  Future signInWithEmailAndPassword(String email, String password) async {
    return await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future creatUserWithEmailAndPassword(String email, String password) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  Future signOut() async {
    return Future.wait([firebaseAuth.signOut(),googleSignIn.signOut()]);
  }


  Future<bool> isSignedIn() async {
    return await firebaseAuth.currentUser != null;
  }

  //ham lay thong tin cua user tren gg
  FuturegetUser() async {
    return await firebaseAuth.currentUser;
  }

}
