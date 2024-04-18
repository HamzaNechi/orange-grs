import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
import 'package:orange_grs/features/visites/domain/repositories/visite_repository.dart';

class GetAllVisiteUseCase{
  final VisiteRepository visiteRepository;

  GetAllVisiteUseCase(this.visiteRepository);

  Future<Either<Failure, List<Visite>>> call() async{
    return await visiteRepository.getAllVisites();
  }
}