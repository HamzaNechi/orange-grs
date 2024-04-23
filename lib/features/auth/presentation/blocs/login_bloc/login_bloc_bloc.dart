import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/utils/global_function_utils.dart';
import 'package:orange_grs/features/auth/domain/entities/login_response.dart';
import 'package:orange_grs/features/auth/domain/entities/user.dart';
import 'package:orange_grs/features/auth/domain/usecases/get_connecteduser_use_case.dart';
import 'package:orange_grs/features/auth/domain/usecases/signin_use_case.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginEvent, LoginState> {

  final SignInUseCase signInUseCase;
  final GetConnectedUserUseCase userConnected;

  LoginBlocBloc({required this.signInUseCase, required this.userConnected}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingLoginState());
      if(event is SignInEvent){
        final Either<Failure, LoginResponse> failorOrLoginResponse = await signInUseCase.call(event.login, event.password);

        failorOrLoginResponse.fold(
          (failure){
            emit(ErrorLoginState(errorMessage: GlobalFunctionUtils.mapFailureToMessage(failure)));
          }, 
          (loginResponse){
            emit(LoadedLoginState(loginResponse: loginResponse));
          });
      }else if(event is GetConnectedUserEvent){
        final Either<Failure, User> failorOrSuccessResponse = await userConnected.call();

        failorOrSuccessResponse.fold(
          (failure){
            if(failure is ExpiredJwtFailure){
              emit(ExpiredJwtState());
            }else{
              emit(ErrorProfileState(errorMessage: GlobalFunctionUtils.mapFailureToMessage(failure)));
            }
          }, 
          (user){
            print('user connected state user = ${user.email}');
            emit(GetConnectedUserState(user: user));
          });
      }
    });
  }
}
