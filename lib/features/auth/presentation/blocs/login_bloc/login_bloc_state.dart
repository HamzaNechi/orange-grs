part of 'login_bloc_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}


final class LoadingLoginState extends LoginState{}


final class LoadedLoginState extends LoginState{
  final LoginResponse loginResponse;

  const LoadedLoginState({required this.loginResponse});

  @override
  List<Object> get props => [loginResponse];
}


final class ErrorLoginState extends LoginState{
  final String errorMessage;

  const ErrorLoginState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}