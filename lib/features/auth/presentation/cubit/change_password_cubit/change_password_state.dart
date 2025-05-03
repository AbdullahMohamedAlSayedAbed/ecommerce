part of 'change_password_cubit.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}
class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final String message;
  const ChangePasswordSuccess([this.message = 'تم تغيير كلمة المرور بنجاح']);


}

class ChangePasswordFailure extends ChangePasswordState {
  final String error;
  const ChangePasswordFailure(this.error);

}

