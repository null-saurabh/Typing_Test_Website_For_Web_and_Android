

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginUserProvider with ChangeNotifier {
  User? _user;

  LoginUserProvider() {
    _user = FirebaseAuth.instance.currentUser;
  }

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }
}
