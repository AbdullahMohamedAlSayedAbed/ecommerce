import 'package:ecommerce/features/auth/domin/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.name});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(id: user.uid, email: user.email!, name: user.displayName!);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], email: json['email'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'name': name};
  }
}
