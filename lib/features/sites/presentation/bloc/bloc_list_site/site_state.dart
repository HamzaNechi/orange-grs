part of 'site_bloc.dart';

sealed class SiteState extends Equatable {
  const SiteState();
  
  @override
  List<Object> get props => [];
}

final class SiteInitial extends SiteState {}

final class LoadingSiteState extends SiteState {}

final class LoadedSiteState extends SiteState {
  final List<Site> sites;

  const LoadedSiteState({required this.sites});

  @override
  List<Object> get props => [sites];
}

final class NombreFactureReelEn6MoisState extends SiteState {
  final int nombre;

  const NombreFactureReelEn6MoisState({required this.nombre});

  @override
  List<Object> get props => [nombre];
}



final class ErrorSiteState extends SiteState {
  final String message;

  const ErrorSiteState({required this.message});

  @override
  List<Object> get props => [message];
}



final class ExpiredTokenState extends SiteState{}
