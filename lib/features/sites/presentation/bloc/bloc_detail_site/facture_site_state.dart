import 'package:equatable/equatable.dart';
import 'package:orange_grs/features/sites/domain/entities/facture_site.dart';

sealed class FactureSiteState extends Equatable {
  const FactureSiteState();
  
  @override
  List<Object> get props => [];
}

final class FactureSiteInitial extends FactureSiteState {}

final class LoadingFactureSiteState extends FactureSiteState {}

final class LoadedFactureSiteState extends FactureSiteState {
  final List<FactureSite> siteFactures;

  const LoadedFactureSiteState({required this.siteFactures});

  @override
  List<Object> get props => [siteFactures];
}


final class ErrorFactureSiteState extends FactureSiteState {
  final String message;

  const ErrorFactureSiteState({required this.message});

  @override
  List<Object> get props => [message];
}