import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';

abstract class VisiteRepository{
  Future<Either<Failure,List<Visite>>> getAllVisites(String? siteCode);
  Future<Either<Failure,String>> addNewVisite(Visite visite, XFile file);
  Future<Either<Failure,String>> deleteVisite(int visiteId);
}