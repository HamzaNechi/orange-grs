import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/reclamation/domain/entities/reclamation.dart';
import 'package:orange_grs/features/reclamation/domain/repositories/reclamation_repo.dart';

class AddNewReclamationUseCase{
  final ReclamationRepository reclamationRepository;

  AddNewReclamationUseCase(this.reclamationRepository);


  Future<Either<Failure, Reclamation>> call(Reclamation reclamation){
    return reclamationRepository.addNewReclamation(reclamation);
  }

}