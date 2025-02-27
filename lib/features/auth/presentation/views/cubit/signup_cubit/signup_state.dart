part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity user;

  const SignupSuccess(this.user);

  @override
  List<Object> get props => [user];
}

final class SignupFailure extends SignupState {
  final String message;

  const SignupFailure(this.message);

  @override
  List<Object> get props => [message];
}
