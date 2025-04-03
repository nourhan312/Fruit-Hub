import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:fruit_hub/features/Auth/data/models/user_model.dart';

import 'package:fruit_hub/features/Auth/domain/entities/user_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService _authService;
  AuthRepoImpl(this._authService);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // need to convert user to user entity
      var user = await _authService.signupWithEmailAndPassword(email, password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("Exception in Auth Repo.createUserWithEmailAndPassword  : ${e.message}");
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await _authService.signInWithEmailAndPassword(email, password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("Exception in Auth Repo.signInWithEmailAndPassword  : ${e.message}");
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _authService.signOut();
    } on CustomException catch (e) {
      log("Exception in Auth Repo.signOut  : ${e.message}");
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await _authService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("Exception in Auth Repo.signInWithGoogle  : ${e.message}");
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await _authService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("Exception in Auth Repo.signInWithFacebook  : ${e.message}");
      return Left(ServerFailure(message: e.message));
    }
  }
}
