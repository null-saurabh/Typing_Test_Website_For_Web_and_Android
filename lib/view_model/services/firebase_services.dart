import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn =   GoogleSignIn();

  signInWithGoogle() async {

    User? user;

    if(kIsWeb){
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try{
        final UserCredential userCredential = await _auth.signInWithPopup(authProvider);
        user = userCredential.user;
      } catch(e){
        rethrow;
      }
    }
    else{
      // final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
            await _googleSignIn.signIn();

        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;

              final AuthCredential credential = GoogleAuthProvider.credential(
                  accessToken: googleSignInAuthentication.accessToken,
                  idToken: googleSignInAuthentication.idToken);

              try {
                final UserCredential userCredential =
                    await _auth.signInWithCredential(credential);

                user = userCredential.user;
              } on FirebaseAuthException {
                rethrow;
              }
              }
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
