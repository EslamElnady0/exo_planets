import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/auth_repo.dart';

part 'send_password_reset_state.dart';

class SendPasswordResetCubit extends Cubit<SendPasswordResetState> {
  SendPasswordResetCubit(this.authRepo) : super(SendPasswordResetInitial());
  final AuthRepo authRepo;

  Future<void> sendPasswordReset({required String email}) async {
    emit(SendPasswordResetLoading());
    var result = await authRepo.resetPassword(email: email);

    result.fold((l) => emit(SendPasswordResetFailure(error: l.errMessage)),
        (r) => emit(SendPasswordResetSuccess()));
  }
}
