import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super( const ShowProfileState(showProfileAnswer: false)) {
    on<BottomNavEvent>((event, emit) {
      if(event is ShowProfileEvent){
        emit(ShowProfileState(showProfileAnswer: event.showProfile));
      }
    });
  }
}
