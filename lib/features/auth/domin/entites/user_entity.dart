class UserEntity {
  final String id;
  final String email;
  final String name;
  final String? imageUrl; 

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.imageUrl, 
  });
}
