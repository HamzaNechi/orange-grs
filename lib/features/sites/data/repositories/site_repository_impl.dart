import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/exceptions.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/network/network_info.dart';
import 'package:orange_grs/features/sites/data/datasources/remote_data_source.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/domain/repositorie/site_repository.dart';

class SiteRepositoryImpl implements SiteRepository{
  final SiteRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SiteRepositoryImpl({required this.remoteDataSource, required this.networkInfo});


  @override
  Future<Either<Failure, List<Site>>> getAllSites(String? siteCode) async {
    if(await networkInfo.isConnected){
      try{
        final remoteSites = await remoteDataSource.getAllSites(siteCode);
        return Right(remoteSites);
      }on ServerException{
        return Left(ServerFailure());
      }on TimeoutException{
        return Left(PanneServerFailure());
      }
      
    }else{
      return Left(OfflineFailure());
    }
  }

}