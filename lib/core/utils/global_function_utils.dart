import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/strings/failures.dart';

class GlobalFunctionUtils{
  //function to get message from failure
  static String mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure : return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure : return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure : return OFFLINE_FAILURE_MESSAGE;
      case PanneServerFailure : return PANNE_SERVER_FAILURE_MESSAGE;
      case ExpiredJwtFailure: return EXPIRED_TOKEN_FAILURE_MESSAGE;
      default: return "Unexpected Error, Please try again later ";
    }
  }
}