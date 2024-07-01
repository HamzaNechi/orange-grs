import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/exceptions.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/network/network_info.dart';
import 'package:orange_grs/features/reclamation/data/datasources/reclamation_datasource.dart';
import 'package:orange_grs/features/reclamation/data/models/reclamation_model.dart';
import 'package:orange_grs/features/reclamation/domain/entities/reclamation.dart';
import 'package:orange_grs/features/reclamation/domain/repositories/reclamation_repo.dart';

class ReclamationRepositoryImpl implements ReclamationRepository{
  final ReclamationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ReclamationRepositoryImpl({required this.remoteDataSource,required this.networkInfo});


  @override
  Future<Either<Failure, Reclamation>> addNewReclamation(Reclamation reclamation) async {
    if(await networkInfo.isConnected){
      try{

        final recModel = ReclamationModel(
          objet: reclamation.objet, 
          problem: reclamation.problem, 
          description: reclamation.description );
        final recl = await remoteDataSource.addReclamation(recModel);
        return Right(recl);

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