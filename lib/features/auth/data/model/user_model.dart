import 'package:ecommerce/features/auth/domin/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.name});
  factory UserModel.fromFirebaseUser(User user, {String? name}) {
    return UserModel(id: user.uid, email: user.email ?? '', name: name ?? '');
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], email: json['email'], name: json['name']);
  }
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(id: entity.id, email: entity.email, name: entity.name);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'name': name};
  }
}
