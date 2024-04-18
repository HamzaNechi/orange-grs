import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_state.dart';
import 'package:orange_grs/features/sites/presentation/pages/site_liste_page.dart';
import 'package:orange_grs/features/visites/presentation/pages/list_visite.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super( BottomNavHomeWidgetState(titleAppBar: "Accueil", index: 0, page: Container(color: Colors.black,))) {
    on<BottomNavEvent>((event, emit) {

      if(event is BottomNavOnChangeEvent){
        switch (event.index){
          case 0 : emit(BottomNavHomeWidgetState(titleAppBar: "Accueil", index: 0, page: Container(color: Colors.black)));
          break;
          case 1 : emit(const BottomNavSiteWidgetState(titleAppBar: "Sites", index: 1, page: SiteListPage()));
          break;
          case 2 : emit(const BottomNavVisiteWidgetState(titleAppBar: "Visites", index: 2, page: ListVisite()));
          break;
        }
      }
    });
  }
}
