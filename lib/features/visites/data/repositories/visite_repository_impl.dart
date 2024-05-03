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
  Future<Either<Failure, List<Visite>>> getAllVisites(String? siteCode) async{
    if(await networkInfo.isConnected){
      try{
        final remoteVisites = await visiteRemoteDataSource.getAllVisites(siteCode);
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
  Future<Either<Failure, String>> addNewVisite(Visite visite, XFile file) async{
    if(await networkInfo.isConnected){
      try{
        final VisiteModel visiteModel = VisiteModel(
          indexCompteur: visite.indexCompteur,
          commentaire: visite.commentaire,
          site: visite.site, 
          otn: visite.otn, 
          oo: visite.oo, 
          tt: visite.tt, 
          tag: visite.tag);
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
  
  @override
  Future<Either<Failure, String>> deleteVisite(int visiteId) async {
    if(await networkInfo.isConnected){
      try{
        final statusDelete = await visiteRemoteDataSource.deleteVisite(visiteId);
        return Right(statusDelete);
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
  Future<Either<Failure, String>> updateVisite(Visite visite, XFile? file) async {
    if(await networkInfo.isConnected){
      try{
        final VisiteModel visiteModel = VisiteModel(
          visiteId: visite.visiteId,
          indexCompteur: visite.indexCompteur,
          commentaire: visite.commentaire,
          site: visite.site, 
          otn: visite.otn, 
          oo: visite.oo, 
          tt: visite.tt, 
          tag: visite.tag);
          String statusUpdate;
          if(file == null){
            statusUpdate = await visiteRemoteDataSource.updateVisite(visiteModel, null);
          }else{
            statusUpdate = await visiteRemoteDataSource.updateVisite(visiteModel, file);
          }
        return Right(statusUpdate);
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