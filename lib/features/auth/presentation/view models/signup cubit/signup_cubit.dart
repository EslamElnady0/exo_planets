import 'package:bloc/bloc.dart';
import 'package:exo_planets/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> signup(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignupLoading());

    var result = await authRepo.signUpWithEmailAndPassword(
        email: email, password: password, name: name);

    result.fold((l) => emit(SignupFailure(error: l.errMessage)),
        (r) => emit(SignupSuccess()));
  }
}
