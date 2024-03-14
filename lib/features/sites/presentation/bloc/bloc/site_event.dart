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
