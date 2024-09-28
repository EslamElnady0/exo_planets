import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_ano_state.dart';

class LoginAnoCubit extends Cubit<LoginAnoState> {
  LoginAnoCubit() : super(LoginAnoInitial());
}
