import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_sign_in.dart';
import '../models/user_create.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreation user);
  Future<Either> getAges();
  Future<Either> signIn(UserSignIn user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signUp(UserCreation user) async {
    try {
      final returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(returnedData.user!.uid)
          .set({
            'firstName': user.firstName,
            'lastName': user.lastName,
            'email': user.email,
            'gender': user.gender,
            'age': user.age,
          });

      return const Right('Creating Account Was Successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The Password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance
              .collection('ages')
              .orderBy('index')
              .get();

      return Right(returnedData.docs);
    } catch (_) {
      return const Left('Please try again ');
    }
  }

  @override
  Future<Either> signIn(UserSignIn user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return const Right('Sign In Successfull');
    } on FirebaseAuthException catch (e) {
      late String message;

      if (e.code == 'invalid-email' || e.code == 'invalid-credential') {
        message = 'Provided email or password is not valid';
      } else {
        message = e.plugin;
      }

      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return const Right('Password reset email is sent!');
    } catch (e) {
      return const Left('Please enter a valid email or try again later!');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
