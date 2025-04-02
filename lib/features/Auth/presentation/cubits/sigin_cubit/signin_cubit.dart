import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/Auth/domain/entities/user_entity.dart';

import '../../../domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;
  bool isPasswordVisible = true;

  void signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    try {
      final result = await authRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      result.fold(
        (failure) {
          emit(SigninFailure(message: failure.message));
        },
        (user) {
          emit(SigninSuccess(user: user));
        },
      );
    } catch (e) {
      emit(SigninFailure(message: e.toString()));
    }
  }

  void passwordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityState());
  }
}
