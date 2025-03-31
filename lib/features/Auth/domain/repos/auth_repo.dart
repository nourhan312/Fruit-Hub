import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/Auth/domain/entities/user_entity.dart';

import '../../../../errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}
