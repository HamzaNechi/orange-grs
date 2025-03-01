import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}


class OfflineFailure extends Failure{
  @override
  List<Object?> get props => [];
}


class ServerFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure{
  @override
  List<Object?> get props => [];
}


class PanneServerFailure extends Failure{
  @override
  List<Object?> get props => [];
}


class LoginFailure extends Failure{
  @override
  List<Object?> get props => [];
}


class ExpiredJwtFailure extends Failure{
  @override
  List<Object?> get props => [];
}