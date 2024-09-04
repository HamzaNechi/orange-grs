import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/auth/domain/entities/login_response.dart';
import 'package:orange_grs/features/auth/domain/entities/user.dart';

abstract class AuthRepository{
  Future<Either<Failure, LoginResponse>> doLogin(String login, String password);
  Future<Either<Failure, User>> getConnectedUser();
  Future<Either<Failure, User>> updatePasswordUser(String newPassword);
}