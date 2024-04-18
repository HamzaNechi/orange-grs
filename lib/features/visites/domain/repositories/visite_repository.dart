import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';

abstract class VisiteRepository{
  Future<Either<Failure,List<Visite>>> getAllVisites();
  Future<Either<Failure,bool>> addNewVisite(Visite visite, XFile file);
}