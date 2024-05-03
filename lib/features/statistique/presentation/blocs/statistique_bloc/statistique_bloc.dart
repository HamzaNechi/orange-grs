import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';

part 'statistique_event.dart';
part 'statistique_state.dart';

class StatistiqueBloc extends Bloc<StatistiqueEvent, StatistiqueState> {
  StatistiqueBloc() : super(StatistiqueInitial()) {
    on<StatistiqueEvent>((event, emit) {
      if(event is InitialSiteSearchFieldEvent){
        emit(InitialSiteSearchFieldState(site: event.site));
      }
    });
  }
}
