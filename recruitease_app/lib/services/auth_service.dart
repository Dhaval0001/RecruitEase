import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recruitease_app/screens/profile.dart';

class AuthService {
  // Google Sign in
  signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // User successfully signed in with Google
      // Access the user information from userCredential.user

      // Update the user's email on the profile screen
      String userEmail = userCredential.user!.email!;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Profile(userEmail: userEmail),
        ),
      );
    } catch (e) {
      // Handle any sign-in errors
    }
  }
}
