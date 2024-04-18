import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';

abstract class VisiteRepository{
  Future<Either<Failure,List<Visite>>> getAllVisites();
}