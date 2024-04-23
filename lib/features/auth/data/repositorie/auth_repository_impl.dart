import 'package:dartz/dartz.dart';
import 'package:orange_grs/core/errors/exceptions.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/network/network_info.dart';
import 'package:orange_grs/features/auth/data/datasources/remote_datasource_auth.dart';
import 'package:orange_grs/features/auth/domain/entities/login_response.dart';
import 'package:orange_grs/features/auth/domain/entities/user.dart';
import 'package:orange_grs/features/auth/domain/repositorie/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({required this.authRemoteDataSource, required this.networkInfo});


  @override
  Future<Either<Failure, LoginResponse>> doLogin(String login, String password) async{
    if(await networkInfo.isConnected){
      try{
        final logIn = await authRemoteDataSource.doLogin(login, password);
        return Right(logIn);
      }on ServerException{
        return Left(ServerFailure());
      }on LoginException{
        return Left(LoginFailure());
      }on Exception{
        return Left(PanneServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getConnectedUser() async{
    if(await networkInfo.isConnected){
      try{
        final user = await authRemoteDataSource.getUserConnected();
        return Right(user);
      }on ServerException{
        return Left(ServerFailure());
      }on ExpiredJwtException{
        return Left(ExpiredJwtFailure());
      }on Exception{
        return Left(PanneServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}