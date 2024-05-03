part of 'statistique_bloc.dart';

sealed class StatistiqueEvent extends Equatable {
  const StatistiqueEvent();

  @override
  List<Object> get props => [];
}



class InitialSiteSearchFieldEvent extends StatistiqueEvent{

  final Site site;
  const InitialSiteSearchFieldEvent({required this.site});

  @override
  List<Object> get props => [site];
}
