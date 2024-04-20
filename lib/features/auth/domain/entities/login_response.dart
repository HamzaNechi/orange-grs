import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable{

  final int statusCode;
  final String message;
  final String token;
  final bool isAdmin;

  const LoginResponse({required this.statusCode, required this.message, required this.token, required this.isAdmin});
  @override
  List<Object?> get props => [statusCode, message,token];

}