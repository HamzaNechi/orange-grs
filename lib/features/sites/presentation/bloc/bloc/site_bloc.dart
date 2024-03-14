import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/strings/failures.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/domain/usecases/get_all_site.dart';
import 'package:orange_grs/features/sites/domain/usecases/serach_site_usecas.dart';

part 'site_event.dart';
part 'site_state.dart';

class SiteBloc extends Bloc<SiteEvent, SiteState> {
  final GetAllSites getAllSites;
  final SearchSiteUseCase searchSiteByCode;
  SiteBloc({required this.getAllSites, required this.searchSiteByCode}) : super(SiteInitial()) {
    on<SiteEvent>((event, emit) async {
      emit(LoadingSiteState());
      final Either<Failure, List<Site>> failureOrSites;

      if(event is GetAllSiteEvent){
        failureOrSites = await getAllSites.call();
      }else if (event is SearchSiteEvent){
        failureOrSites = await searchSiteByCode.call(event.siteCode);
      }else{
        failureOrSites = await getAllSites.call();
      }

      print('failure or list = $failureOrSites');
      
      failureOrSites.fold(
        (failure){
          emit(ErrorSiteState(message: _mapFailureToMessage(failure)));
        }, 
        (sites) {
          emit(LoadedSiteState(sites: sites));
        }
        );
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
