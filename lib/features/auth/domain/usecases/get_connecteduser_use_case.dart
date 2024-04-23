import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/auth/domain/entities/user.dart';
import 'package:orange_grs/features/auth/domain/repositorie/auth_repository.dart';

class GetConnectedUserUseCase{
  final AuthRepository authRepository;

  GetConnectedUserUseCase(this.authRepository);


  Future<Either<Failure, User>> call()async {
    return await authRepository.getConnectedUser();
  }
}