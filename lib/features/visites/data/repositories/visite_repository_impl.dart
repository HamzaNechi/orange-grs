import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/exceptions.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/network/network_info.dart';
import 'package:orange_grs/features/visites/data/datasources/visite_remote_datasource.dart';
import 'package:orange_grs/features/visites/data/model/visite_model.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
import 'package:orange_grs/features/visites/domain/repositories/visite_repository.dart';

class VisiteRepositoryImpl extends VisiteRepository{
  final VisiteRemoteDataSource visiteRemoteDataSource;
  final NetworkInfo networkInfo;

  VisiteRepositoryImpl({required this.visiteRemoteDataSource, required this.networkInfo});


  @override
  Future<Either<Failure, List<Visite>>> getAllVisites() async{
    if(await networkInfo.isConnected){
      try{
        final remoteVisites = await visiteRemoteDataSource.getAllVisites();
        return Right(remoteVisites);
      }on ExpiredJwtException{
        return Left(ExpiredJwtFailure());
      }on ServerException{
        return Left(ServerFailure());
      }on TimeoutException{
        return Left(PanneServerFailure());
      }on Exception{
        return Left(PanneServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addNewVisite(Visite visite, XFile file) async{
    if(await networkInfo.isConnected){
      try{
        final VisiteModel visiteModel = VisiteModel(indexCompteur: visite.indexCompteur,commentaire: visite.commentaire,site: visite.site);
        final statusAdd = await visiteRemoteDataSource.addNewVisite(visiteModel, file);
        return Right(statusAdd);
      }on ExpiredJwtException{
        return Left(ExpiredJwtFailure());
      }on ServerException{
        return Left(ServerFailure());
      }on TimeoutException{
        return Left(PanneServerFailure());
      }on Exception{
        return Left(PanneServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}