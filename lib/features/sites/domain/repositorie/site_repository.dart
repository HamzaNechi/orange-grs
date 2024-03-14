import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';

abstract class SiteRepository{
  Future<Either<Failure, List<Site>>> getAllSites(String? siteCode);
}