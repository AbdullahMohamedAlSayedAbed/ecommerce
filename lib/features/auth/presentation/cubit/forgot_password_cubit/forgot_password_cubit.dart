import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitial());
  final AuthRepo authRepo;
  void sendPasswordResetEmail(String email) async {
    emit(ForgotPasswordLoading());
    final result =await authRepo.sendPasswordResetEmail(emailAddress: email);
    result.fold(
      (failure) => emit(ForgotPasswordFailure(failure.message)),
      (success) =>
          emit(ForgotPasswordSuccess("تم ارسال رابط اعادة تعيين كلمة المرور")),
    );
  }
}
