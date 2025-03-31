import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/Auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/user_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignupError(error: failure.message)),
      (user) => emit(SignupSuccess(user: user)),
    );
  }
}
