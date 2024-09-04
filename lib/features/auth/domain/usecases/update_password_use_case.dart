import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/auth/domain/entities/user.dart';
import 'package:orange_grs/features/auth/domain/repositorie/auth_repository.dart';

class UpdateUserPasswordUseCase{
  final AuthRepository authRepository;

  UpdateUserPasswordUseCase(this.authRepository);

  Future<Either<Failure, User>> call(String newPassword)async {
    return await authRepository.updatePasswordUser(newPassword);
  }
}