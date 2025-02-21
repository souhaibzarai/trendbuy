import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trendbuy/features/auth/data/models/user_create.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreation user);
}

class AuthFirebaseAuthServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signUp(UserCreation user) async {
    try {
      final returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );

      await FirebaseFirestore.instance.doc(returnedData.user!.uid).set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'password': user.password,
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
}
