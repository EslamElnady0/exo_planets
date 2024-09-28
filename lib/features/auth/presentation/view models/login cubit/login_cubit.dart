import 'package:bloc/bloc.dart';
import 'package:exo_planets/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    var result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);

    result.fold((l) => emit(LoginFailure(message: l.errMessage)),
        (r) => emit(LoginSuccess()));
  }
}
