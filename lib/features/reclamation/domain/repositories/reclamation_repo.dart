import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/reclamation/domain/entities/reclamation.dart';

abstract class ReclamationRepository{
  Future<Either<Failure, Reclamation>> addNewReclamation(Reclamation reclamation);
}