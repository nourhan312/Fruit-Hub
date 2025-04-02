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
      var user = await _authService.signInWithEmailAndPassword(email, password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("Exception in Auth Repo.createUserWithEmailAndPassword  : ${e.message}");
      return Left(ServerFailure(message: e.message));
    }
  }
}
