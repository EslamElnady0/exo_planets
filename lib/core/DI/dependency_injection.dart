import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exo_planets/features/auth/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);

  getIt.registerLazySingleton<AuthRepo>(() =>
      AuthRepo(getIt.get<FirebaseAuth>(), getIt.get<FirebaseFirestore>()));
}
