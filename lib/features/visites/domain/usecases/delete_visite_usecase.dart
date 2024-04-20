import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/visites/domain/repositories/visite_repository.dart';

class DeleteVisiteUseCase{
  final VisiteRepository visiteRepository;

  DeleteVisiteUseCase(this.visiteRepository);

  Future<Either<Failure, String>> call(int visiteId) async{
    return await visiteRepository.deleteVisite(visiteId);
  }
}