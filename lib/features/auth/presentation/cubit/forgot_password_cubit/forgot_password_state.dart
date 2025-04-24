part of 'forgot_password_cubit.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitial extends ForgotPasswordState {}
final class ForgotPasswordLoading extends ForgotPasswordState {}
final class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;

  const ForgotPasswordSuccess(this.message);

  @override
  List<Object> get props => [message];
}
final class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;

  const ForgotPasswordFailure(this.error);

  @override
  List<Object> get props => [error];  
}


