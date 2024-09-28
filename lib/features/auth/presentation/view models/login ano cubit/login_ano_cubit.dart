import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/auth_repo.dart';

part 'login_ano_state.dart';

class LoginAnoCubit extends Cubit<LoginAnoState> {
  LoginAnoCubit(this.authRepo) : super(LoginAnoInitial());
  final AuthRepo authRepo;

  Future<void> loginAno() async {
    emit(LoginAnoLoading());
    var result = await authRepo.logInAno();
    result.fold((l) => emit(LoginAnoFailure(error: l.errMessage)),
        (r) => emit(LoginAnoSuccess()));
  }
}
