part of 'login_ano_cubit.dart';

@immutable
sealed class LoginAnoState {}

final class LoginAnoInitial extends LoginAnoState {}

final class LoginAnoLoading extends LoginAnoState {}

final class LoginAnoSuccess extends LoginAnoState {}

final class LoginAnoFailure extends LoginAnoState {
  final String error;

  LoginAnoFailure({required this.error});
}
