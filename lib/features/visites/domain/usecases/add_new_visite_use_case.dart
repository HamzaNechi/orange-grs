


import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
import 'package:orange_grs/features/visites/domain/repositories/visite_repository.dart';

class AddNewVisiteUseCase{
  final VisiteRepository visiteRepository;

  AddNewVisiteUseCase(this.visiteRepository);

  Future<Either<Failure, String>> call(Visite visite, XFile file) async{
    return await visiteRepository.addNewVisite(visite,file); //add new
  }
}