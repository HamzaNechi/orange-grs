import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/sites/domain/repositorie/site_repository.dart';

class GetNombreFactureReel{
  final SiteRepository siteRepository;

  GetNombreFactureReel(this.siteRepository);

  Future<Either<Failure, Map<String, dynamic>>> call(int siteId) async{
    return await siteRepository.getNombreFactureReelen6Mois(siteId);
  }
}