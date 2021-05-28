import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_management/features/user.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool get isAnonymous => _auth.currentUser!.isAnonymous;

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  // sign in with google
  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  UserLog? _fromFirebaseUser(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? UserLog(uid: user.uid) : null;
  }

  // sign up with email and password
  Future registerUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _fromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _fromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _fromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // logout button - works for all login instances
  logout() async {
    if (googleSignIn.currentUser?.id != null) {
      await googleSignIn.disconnect();
    }
    FirebaseAuth.instance.signOut();
  }
}
