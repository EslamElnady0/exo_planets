import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:exo_planets/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/model/user_model.dart';

class AuthRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepo(this.auth, this.firestore);

  Future<Either<Failure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseException(e));
      }
      log(e.toString());
      return left(ServerFailure(errMessage: "Something went wrong"));
    }
  }

  Future<Either<Failure, void>> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await auth.currentUser!.updateDisplayName(name);
      await addUserToFirestore(UserModel(
        email: email,
        uid: auth.currentUser!.uid,
        name: name,
      ));
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseException(e));
      }
      log(e.toString());
      return left(
          ServerFailure(errMessage: "Something went wrong, try again later"));
    }
  }

  Future<Either<Failure, void>> signOut() async {
    try {
      await auth.signOut();
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseException(e));
      }
      log(e.toString());
      return left(ServerFailure(errMessage: "Something went wrong"));
    }
  }

  Future<Either<Failure, void>> logInAno() async {
    try {
      await auth.signInAnonymously();
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseException(e));
      }
      log(e.toString());
      return left(ServerFailure(errMessage: "Something went wrong"));
    }
  }

  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseException(e));
      }
      log(e.toString());
      return left(ServerFailure(errMessage: "Something went wrong"));
    }
  }

  Future<Either<Failure, void>> addUserToFirestore(UserModel user) async {
    try {
      await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(user.toJson());
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseException(e));
      }
      log(e.toString());
      return left(ServerFailure(errMessage: "Something went wrong"));
    }
  }
}
