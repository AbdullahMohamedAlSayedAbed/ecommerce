class UserEntity {
  final String id;
  final String email;
  final String name;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
  });
  toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }
}