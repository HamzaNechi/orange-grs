import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable{

  final int statusCode;
  final String message;
  final String token;

  const LoginResponse({required this.statusCode, required this.message, required this.token});
  @override
  List<Object?> get props => [statusCode, message,token];

}