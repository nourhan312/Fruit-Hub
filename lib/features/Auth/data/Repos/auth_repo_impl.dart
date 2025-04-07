import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';

import 'package:fruit_hub/features/Auth/data/models/user_model.dart';

import 'package:fruit_hub/features/Auth/domain/entities/user_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService _authService;
  final DatabaseService _databaseService;
  AuthRepoImpl(
    this._authService,
    this._databaseService,
  );
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await _authService.signupWithEmailAndPassword(email, password);
      // need to convert user to user entity
      var userEntity =
          UserEntity(uId: user.uid, name: name, email: email, phoneNumber: '');
      // add user to firestore
      await addUser(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await _authService.deleteUser();
      }
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
      var userEntity = await getUser(uId: user.uid);
      return Right(userEntity);
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
    User? user;
    try {
      user = await _authService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      addUser(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await _authService.deleteUser();
      }
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

  @override
  Future addUser({required UserEntity user}) async {
    await _databaseService.addData(
      path: BackendEndPoints.userCollection,
      data: user.toMap(),
    );
  }

  @override
  Future<UserEntity> getUser({required String uId}) async {
    var userData = await _databaseService.getData(
        path: BackendEndPoints.userCollection, id: uId);
    return UserModel.fromMap(userData);
  }
}
