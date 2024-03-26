import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/strings/failures.dart';
import 'package:orange_grs/features/auth/domain/entities/login_response.dart';
import 'package:orange_grs/features/auth/domain/usecases/signin_use_case.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginEvent, LoginState> {

  final SignInUseCase signInUseCase;

  LoginBlocBloc({required this.signInUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingLoginState());
      if(event is SignInEvent){
        final Either<Failure, LoginResponse> failorOrLoginResponse = await signInUseCase.call(event.login, event.password);

        failorOrLoginResponse.fold(
          (failure){
            emit(ErrorLoginState(errorMessage: _mapFailureToMessage(failure)));
          }, 
          (loginResponse){
            emit(LoadedLoginState(loginResponse: loginResponse));
          });
      }
    });
  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure : return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure : return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure : return OFFLINE_FAILURE_MESSAGE;
      case PanneServerFailure : return PANNE_SERVER_FAILURE_MESSAGE;
      case LoginFailure : return LOGIN_FAILURE_MESSAGE;
      default: return "Unexpected Error, Please try again later ";
    }
  }
}
