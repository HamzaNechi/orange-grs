import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
import 'package:orange_grs/features/visites/domain/repositories/visite_repository.dart';

class UpdateVisiteUseCase{
  final VisiteRepository visiteRepository;

  UpdateVisiteUseCase(this.visiteRepository);

  Future<Either<Failure, String>> call(Visite visite, XFile? file) async{
    if(file == null){
      return await visiteRepository.updateVisite(visite, null);
    }
    return await visiteRepository.updateVisite(visite, file); //update visite
  }
}