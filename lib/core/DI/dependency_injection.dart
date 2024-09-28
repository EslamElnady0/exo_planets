import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exo_planets/features/auth/data/repo/auth_repo.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/login%20ano%20cubit/login_ano_cubit.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/login%20cubit/login_cubit.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/send%20password%20reset%20cubit/send_password_reset_cubit.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/signup%20cubit/signup_cubit.dart';
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

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SendPasswordResetCubit>(
      () => SendPasswordResetCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<LoginAnoCubit>(
      () => LoginAnoCubit(getIt.get<AuthRepo>()));
}
