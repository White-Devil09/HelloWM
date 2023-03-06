import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final globalUser = await googleSignIn.signIn();
      if (globalUser == null) return;
      _user = globalUser;

      final googleAuth = await globalUser.authentication;

      final crediential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(crediential);
      notifyListeners();
    } catch (e) {
      stdout.write(e.toString());
    }

    Future logout() async {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    }
  }
}
