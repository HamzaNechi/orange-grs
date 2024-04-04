import 'package:equatable/equatable.dart';

class FactureSiteEvent extends Equatable{
  @override
  List<Object?> get props => [];

}



class GetAllFactureSiteEvent extends FactureSiteEvent{
  final int siteId;

  GetAllFactureSiteEvent({required this.siteId});


  @override
  List<Object?> get props => [siteId];
}


class RefreshFactureSiteEvent extends FactureSiteEvent{
  final int siteId;

  RefreshFactureSiteEvent({required this.siteId});


  @override
  List<Object?> get props => [siteId];
}