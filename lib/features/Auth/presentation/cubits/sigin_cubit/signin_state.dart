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

final class SigninWithGoogleLoading extends SigninState {}

final class SigninWithGoogleSuccess extends SigninState {
  final UserEntity user;
  SigninWithGoogleSuccess({required this.user});
}

final class SigninWithGoogleFailure extends SigninState {
  final String message;
  SigninWithGoogleFailure({required this.message});
}

final class SigninWithFacebookLoading extends SigninState {}

final class SigninWithFacebookSuccess extends SigninState {
  final UserEntity user;
  SigninWithFacebookSuccess({required this.user});
}

final class SigninWithFacebookFailure extends SigninState {
  final String message;
  SigninWithFacebookFailure({required this.message});
}

final class PasswordVisibilityState extends SigninState {}
