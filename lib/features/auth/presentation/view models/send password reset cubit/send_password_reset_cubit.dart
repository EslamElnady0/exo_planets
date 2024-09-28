import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'send_password_reset_state.dart';

class SendPasswordResetCubit extends Cubit<SendPasswordResetState> {
  SendPasswordResetCubit() : super(SendPasswordResetInitial());
}
