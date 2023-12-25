import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:typingtest/view_model/services/api_services.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final ApiService _apiService = ApiService();

  // Private constructor
  FirebaseAuthService._();

  // Singleton access
  static final FirebaseAuthService instance = FirebaseAuthService._();

  Future<User?> signInWithGoogle() async {
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential = await _auth.signInWithPopup(authProvider);
        user = userCredential.user;
        //
        // if (user != null) {
        //   await _apiService.registerUser(user.email ?? '', user.displayName ?? '');
        // }

      } catch (e) {
        rethrow;
      }
    } else {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential = await _auth.signInWithCredential(credential);
          user = userCredential.user;

          // if (user != null) {
          //   await _apiService.registerUser(user.email ?? '', user.displayName ?? '');
          // }

        } on FirebaseAuthException {
          rethrow;
        }
      }
    }
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
  Future<void> initialize() async {
    await _auth.setPersistence(Persistence.LOCAL);
  }
}
