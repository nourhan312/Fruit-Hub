import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/Auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.uId,
      required super.name,
      required super.email,
      required super.phoneNumber});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      phoneNumber: user.phoneNumber ?? '',
    );
  }
}
