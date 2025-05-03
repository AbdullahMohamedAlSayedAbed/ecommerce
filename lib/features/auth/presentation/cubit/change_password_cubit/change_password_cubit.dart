import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._authRepo) : super(ChangePasswordInitial());
    final AuthRepo _authRepo;

  Future<void> changePassword(String newPassword) async {
    emit(ChangePasswordLoading());
    final result = await _authRepo.updatePassword(password: newPassword);
    result.fold(
      (failure) => emit(ChangePasswordFailure(failure.message)),
      (_)       => emit(ChangePasswordSuccess()),
    );
  }
}
