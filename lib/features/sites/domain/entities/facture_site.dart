import 'package:equatable/equatable.dart';

class FactureSite extends Equatable{
  final int itemInvoiceId;
  final int siteId;
  final String? description;
  final String itemType;
  final DateTime itemDate;
  final int? consommationKwh;
  final double? montantConsommation;
  final double? credit;
  final double? tva;
  final double finalSolde;
  final int month;
  final int year;

  const FactureSite({required this.itemInvoiceId, required this.siteId, this.description, required this.itemType, required this.itemDate, this.consommationKwh, this.montantConsommation, this.credit, this.tva, required this.finalSolde, required this.month, required this.year});
  
  @override
  List<Object?> get props => [itemInvoiceId, siteId, description, itemType, itemDate, consommationKwh, montantConsommation, credit, tva,finalSolde, month, year];
}