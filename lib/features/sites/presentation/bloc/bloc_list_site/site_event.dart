part of 'site_bloc.dart';

sealed class SiteEvent extends Equatable {
  const SiteEvent();

  @override
  List<Object> get props => [];
}



class GetAllSiteEvent extends SiteEvent{}


class SearchSiteEvent extends SiteEvent{
  final String siteCode;

  const SearchSiteEvent({required this.siteCode});

  @override
  List<Object> get props => [siteCode];
}


class NombreFactureReelEvent extends SiteEvent{
  final int siteIdd;

  const NombreFactureReelEvent({required this.siteIdd});

  @override
  List<Object> get props => [siteIdd];
}


class RefreshListSiteEvent extends SiteEvent{}
