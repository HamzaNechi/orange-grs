part of 'login_bloc_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}



class SignInEvent extends LoginEvent{
  final String login;
  final String password;

  const SignInEvent({required this.login, required this.password});

  @override
  List<Object> get props => [login,password];
}
