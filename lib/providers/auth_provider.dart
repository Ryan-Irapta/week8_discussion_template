import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:week8datapersistence/api/firebase_auth_api.dart';

class UserAuthProvider with ChangeNotifier{
  late FireBaseAuthAPI authService;
  late Stream<User?> userStream;
  User? user;
  
  UserAuthProvider(){
    authService = FireBaseAuthAPI();
    userStream = authService.getUserStream();
  }

  Future<String> signIn(String email, String password) async {
    String message = await authService.signIn(email, password);
    notifyListeners();
    return message;
  }

  Future<String> signUp(String email, String password) async {
    String message = await authService.signUp(email, password);
    notifyListeners();
    return message;
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }

}