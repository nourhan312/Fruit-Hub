import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  // Firebase authentication service implementation
  // This class will handle user authentication using Firebase

  Future<User> signupWithEmailAndPassword(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in Authentication Service.createUserWithEmailAndPassword  : ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: ' The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'The email address is badly formatted.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message:
                'The password is invalid or the user does not have a password.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Network error, please check your connection.');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
            message: 'Too many requests. Please wait a moment and try again.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(
            message: 'Signing in with Email and Password is not enabled.');
      } else if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'user-disabled') {
        throw CustomException(
            message: 'User with this email has been disabled.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(
            message: 'Signing in with Email and Password is not enabled.');
      } else {
        throw CustomException(message: 'An unknown error occurred.');
      }
    } catch (e) {
      throw CustomException(message: 'An unknown error occurred.');
    }
  }

  Future<User> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in Authentication Service.signInWithEmailAndPassword  : ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: "The password or email is invalid ");
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'The password or email is invalid ');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: ' The password or email is invalid');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Network error, please check your connection.');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
            message: 'Too many requests. Please wait a moment and try again.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(
            message: 'Signing in with Email and Password is not enabled.');
      } else {
        throw CustomException(message: 'An unknown error occurred.');
      }
    } catch (e) {
      log("Exception in Authentication Service.signInWithEmailAndPassword  : ${e.toString()}");
      throw CustomException(message: 'An unknown error occurred.');
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log("Exception in Authentication Service.signOut  : ${e.toString()}");
      throw CustomException(message: 'An unknown error occurred.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await (FirebaseAuth.instance.signInWithCredential(credential))
        .then((value) => value.user!);
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((value) {
      return value.user!;
    });
  }
}
