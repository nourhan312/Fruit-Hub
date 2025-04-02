part of 'signin_cubit.dart';

sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity user;
  SigninSuccess({required this.user});
}

final class SigninFailure extends SigninState {
  final String message;
  SigninFailure({required this.message});
}

final class PasswordVisibilityState extends SigninState {}
