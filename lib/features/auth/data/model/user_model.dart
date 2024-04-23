import 'package:orange_grs/features/auth/domain/entities/user.dart';

class UserModel extends User{
  const UserModel({required super.login, 
  required super.firstName, 
  required super.lastName, 
  required super.role, 
  required super.email, 
  required super.function});


  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      login: json['login'] ?? '', 
      firstName: json['firstName'] ?? '', 
      lastName: json['lastName'] ?? '', 
      role: json['profile']['profile'] ?? '', 
      email: json['email'] ?? '', 
      function: json['function'] ?? '');
  }

}