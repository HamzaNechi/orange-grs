import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/domain/repositorie/site_repository.dart';

class SearchSiteUseCase{
  final SiteRepository siteRepository;

  SearchSiteUseCase(this.siteRepository);

  Future<Either<Failure, List<Site>>> call(String siteCode) async{
    return await siteRepository.getAllSites(siteCode);
  }
}