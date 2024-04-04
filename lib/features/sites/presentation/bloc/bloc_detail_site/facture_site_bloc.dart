import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/strings/failures.dart';
import 'package:orange_grs/features/sites/domain/usecases/get-all_facture.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_event.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_state.dart';

class FactureSiteBloc extends Bloc<FactureSiteEvent, FactureSiteState>{
  final GetAllFacturesSitesUseCase getAllFacturesSites;
  FactureSiteBloc({required this.getAllFacturesSites}) : super(FactureSiteInitial()){
    on<FactureSiteEvent>((event, emit) async {
      emit(LoadingFactureSiteState());



      if(event is GetAllFactureSiteEvent){
        final failorOrFactures = await getAllFacturesSites(event.siteId);

        failorOrFactures.fold(
          (failure) {
            if(failure is ExpiredJwtFailure){
              emit(ExpiredTokenDetailSiteState());
            }else{
              emit(ErrorFactureSiteState(message: _mapFailureToMessage(failure)));
            }
            
          }, 
          (factures) {
            emit(LoadedFactureSiteState(siteFactures: factures));
          });
      }else if( event is RefreshFactureSiteEvent){
        final failorOrFactures = await getAllFacturesSites(event.siteId);

        failorOrFactures.fold(
          (failure) {
            if(failure is ExpiredJwtFailure){
              emit(ExpiredTokenDetailSiteState());
            }else{
              emit(ErrorFactureSiteState(message: _mapFailureToMessage(failure)));
            }
            
          }, 
          (factures) {
            emit(LoadedFactureSiteState(siteFactures: factures));
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
      default: return "Unexpected Error, Please try again later ";
    }
  }
  
}