import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/Auth/domain/entities/user_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future addUser({
    required UserEntity user,
  });

  Future<UserEntity> getUser({
    required String uId,
  });
}
