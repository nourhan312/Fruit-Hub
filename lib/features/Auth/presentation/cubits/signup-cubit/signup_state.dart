part of 'signup_cubit.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity user;

  SignupSuccess({required this.user});
}

final class SignupError extends SignupState {
  final String error;

  SignupError({required this.error});
}

final class PasswordVisibilityState extends SignupState {}
