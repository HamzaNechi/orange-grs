import 'package:orange_grs/features/auth/domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse{
  const LoginResponseModel({required super.statusCode, required super.message, required super.token, required super.isAdmin});


  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(
      statusCode: json['statusCode'], 
      message: json['message'], 
      token: json['token'], 
      isAdmin: json['admin'], );
  }
}