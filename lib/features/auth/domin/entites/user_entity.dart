class UserEntity {
  final String id;
  final String email;
  final String name;
  final String? imageUrl; // حقل جديد لتخزين رابط الصورة

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.imageUrl, // nullable لأن الصورة قد لا تكون موجودة
  });
}
