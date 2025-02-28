part of 'signin_cubit.dart';

sealed class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity user;

  const SigninSuccess(this.user);

  @override
  List<Object> get props => [user];
}

final class SigninFailure extends SigninState {
  final String message;

  const SigninFailure(this.message);

  @override
  List<Object> get props => [message];
}
final class SigninGoogleSuccess extends SigninState {
  final UserEntity user;

  const SigninGoogleSuccess(this.user);

  @override
  List<Object> get props => [user];
}

final class SigninFacebookSuccess extends SigninState {
  final UserEntity user;

  const SigninFacebookSuccess(this.user);

  @override
  List<Object> get props => [user];
}

