import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/domin/entites/user_entity.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithCredentials(email, password);
    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninGoogleSuccess(user)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninFacebookSuccess(user)),
    );
  }
}
