import 'package:firebase_core/firebase_core.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromFirebaseException(FirebaseException exception) {
    return ServerFailure(
        errMessage:
            exception.message ?? 'Something went wrong, try again later :(');
  }
}
