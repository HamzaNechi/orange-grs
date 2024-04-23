import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/utils/global_function_utils.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/domain/usecases/get_all_site.dart';
import 'package:orange_grs/features/sites/domain/usecases/get_nombre_facture_reel.dart';
import 'package:orange_grs/features/sites/domain/usecases/serach_site_usecas.dart';

part 'site_event.dart';
part 'site_state.dart';

class SiteBloc extends Bloc<SiteEvent, SiteState> {
  final GetAllSites getAllSites;
  final SearchSiteUseCase searchSiteByCode;
  final GetNombreFactureReel getNombreFactureReel;
  SiteBloc({required this.getAllSites, required this.searchSiteByCode, required this.getNombreFactureReel}) : super(SiteInitial()) {
    on<SiteEvent>((event, emit) async {
      emit(LoadingSiteState());

      if(event is NombreFactureReelEvent){
        final Either<Failure, Map<String, dynamic>> nb = await getNombreFactureReel(event.siteIdd);
        nb.fold(
          (failure){
            String errorMessage = GlobalFunctionUtils.mapFailureToMessage(failure);
            emit(ErrorSiteState(message: errorMessage));
          }, 
          (nbFR) {
            emit(NombreFactureReelEn6MoisState(nombre: nbFR['invoices'], district: nbFR['district']));
          }
          );
        
      }else{
        final Either<Failure, List<Site>> failureOrSites;

        if(event is GetAllSiteEvent || event is RefreshListSiteEvent){
          failureOrSites = await getAllSites.call();
        }else if (event is SearchSiteEvent){
          failureOrSites = await searchSiteByCode.call(event.siteCode);
        }else{
          failureOrSites = await getAllSites.call();
        }
        
        failureOrSites.fold(
          (failure){
            if(failure is ExpiredJwtFailure){
              emit(ExpiredTokenState());
            }else{
              String errorMessage = GlobalFunctionUtils.mapFailureToMessage(failure);
              emit(ErrorSiteState(message: errorMessage));
            }
            
          }, 
          (sites) {
            emit(LoadedSiteState(sites: sites));
          }
          );
      }


      
    });
  }
}
