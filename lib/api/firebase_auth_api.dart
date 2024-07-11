import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthAPI{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?>getUserStream(){
    return auth.authStateChanges();
  }

  User? getUser(){
    return auth.currentUser;
  }

  Future<String> signIn(String email, String password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Successfully signed in!";
    } on FirebaseException catch (e){
      return "failed with error ${e.code}";
    }
  }

  Future<String> signUp(String email, String password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Successfully signed in!";
    } on FirebaseException catch (e){
      return "failed with error ${e.code}";
    }
  }
  
  Future<String> signOut() async {
    try{
      await auth.signOut();
      return "Successfully signed in!";
    } on FirebaseException catch (e){
      return "failed with error ${e.code}";
    }
  }

}