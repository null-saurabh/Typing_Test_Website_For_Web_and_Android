

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginUserProvider with ChangeNotifier {
  User? _user;
  String? _userEmail;

  // LoginUserProvider() {
  //   _user = FirebaseAuth.instance.currentUser;
  // }

  User? get user => _user;
  String? get userEmail => _userEmail;

  void setUser(User? user) {
    _user = user;
    if (user != null) {
      _userEmail = user.email;
    } else {
      _userEmail = null;
    }
    notifyListeners();
  }
}
