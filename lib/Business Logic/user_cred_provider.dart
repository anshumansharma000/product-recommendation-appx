import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:product_recommendation_app/Services/Auth/auth.dart';
import 'package:product_recommendation_app/Services/LocalServices/shared_preferences_data_storage.dart';
import 'package:flutter/material.dart';

class UserCredProvider with ChangeNotifier {

  final Auth auth = Auth();
  final LocalStorageServices localStorageServices = LocalStorageServices();

  signUp(String email, String password) async {
    final user = await auth.signUpWithEmail(email, password);
    if (user != null) {
      LocalStorageServices.saveUserLoggedInSharedPreference(true);
      LocalStorageServices.saveUserEmailSharedPreference(user.email);
      notifyListeners();
      return user;
    }
  }
  signIn(String email, String password) async {
    final user = await auth.signUpWithEmail(email, password);
    if (user != null) {
      LocalStorageServices.saveUserLoggedInSharedPreference(true);
      LocalStorageServices.saveUserEmailSharedPreference(user.email);
      notifyListeners();
      return user;
    }
  }

  googleSignIn() async {
    final user = await auth.signInWithGoogle();
    if (user != null) {
      LocalStorageServices.saveUserLoggedInSharedPreference(true);
      LocalStorageServices.saveUserEmailSharedPreference(user.user.email);
      notifyListeners();
      return user;
    }
  }

  verifyEmail() async{
    await auth.verifyEmailOnSignUp();

    Timer timer = Timer.periodic(Duration(seconds: 3), (timer) async{
      bool isVerified = await auth.checkEmailVerified();
      if(isVerified){
        timer.cancel();
        //Go to Home Screen

      }
    });
  }

}
