import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/auth/domain/entities/login_response.dart';
import 'package:orange_grs/features/auth/domain/repositorie/auth_repository.dart';

class SignInUseCase{
  final AuthRepository authRepository;

  SignInUseCase(this.authRepository);


  Future<Either<Failure, LoginResponse>> call(String login, String password)async {
    return await authRepository.doLogin(login, password);
  }
}