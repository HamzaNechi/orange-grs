import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/sites/domain/entities/facture_site.dart';
import 'package:orange_grs/features/sites/domain/repositorie/site_repository.dart';

class GetAllFacturesSitesUseCase{
  final SiteRepository siteRepository;

  GetAllFacturesSitesUseCase(this.siteRepository);

  Future<Either<Failure, List<FactureSite>>> call(int siteId) async{
    return await siteRepository.getAllFactureSites(siteId);
  }
}