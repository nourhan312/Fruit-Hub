class UserEntity {
  final String name;
  final String email;
  final String phoneNumber;
  final String uId;

  UserEntity({
    required this.uId,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  toMap() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
