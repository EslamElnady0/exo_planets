part of 'send_password_reset_cubit.dart';

@immutable
sealed class SendPasswordResetState {}

final class SendPasswordResetInitial extends SendPasswordResetState {}

final class SendPasswordResetLoading extends SendPasswordResetState {}

final class SendPasswordResetSuccess extends SendPasswordResetState {}

final class SendPasswordResetFailure extends SendPasswordResetState {
  final String error;
  SendPasswordResetFailure({required this.error});
}
