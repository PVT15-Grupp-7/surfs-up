import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:surfs_up/data/app_user_data.dart';

/// Authentication Service class that handles all Firebase authentication related tasks.
/// The different methods to sign in and sign out will transform a Firebase User into
/// an AppUser object and return it. If the methods fail, they will print return null and
/// when in DebugMode print the error message.
class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Transform Firebase User to custom AppUser.
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  /// Stream of AppUser maped from Firebase User, that keeps track of state changes
  /// such as if the user is logged in or out. Used by the StreamProvider in main.dart.
  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  /// Method to sign in anonymously through FirebaseAuth.signInAnonymously().
  /// Returns the AppUser.
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  /// Method to sign in with email and password through FirebaseAuth.signInWithEmailAndPassword().
  /// Returns the AppUser.
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential? result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  /// Method to register with email and password through FirebaseAuth.createUserWithEmailAndPassword().
  /// Returns the AppUser.
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
        return null;
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
        return null;
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  /// Sign out method through FirebaseAuth.signOut()
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
