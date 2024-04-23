import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String login;
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final String function;

  const User({required this.login, 
  required this.firstName, 
  required this.lastName, 
  required this.role, 
  required this.email, 
  required this.function});

  @override
  List<Object?> get props => [login, firstName, lastName, role, email,function];

}