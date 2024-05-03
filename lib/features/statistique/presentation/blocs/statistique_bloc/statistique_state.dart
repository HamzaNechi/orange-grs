part of 'statistique_bloc.dart';

sealed class StatistiqueState extends Equatable {
  const StatistiqueState();
  
  @override
  List<Object> get props => [];
}

final class StatistiqueInitial extends StatistiqueState {}


class InitialSiteSearchFieldState extends StatistiqueState{

  final Site site;
  const InitialSiteSearchFieldState({required this.site});

  @override
  List<Object> get props => [site];
}
