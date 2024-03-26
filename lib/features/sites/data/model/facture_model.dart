import 'package:orange_grs/features/sites/domain/entities/facture_site.dart';

class FactureSiteModel extends FactureSite{

  const FactureSiteModel({required super.itemInvoiceId, required super.siteId, super.description, required super.itemType, required super.itemDate, super.consommationKwh, super.montantConsommation, super.credit, super.tva, required super.finalSolde, required super.month, required super.year});


  factory FactureSiteModel.fromJson(Map<String, dynamic> json){
    return FactureSiteModel(
      siteId: json['siteId']['siteId'],
      itemType: json['itemType'] == 1 ? 'Réelle' : 'Intermédiaire', 
      consommationKwh: json['consumptionKwh'], 
      credit: json['credit'],
      description: json['description'],
      finalSolde: json['finalSale'],
      itemDate: DateTime.parse(json['itemDate']),
      itemInvoiceId: json['itemId'],
      montantConsommation: json['consumptionAmount'],
      tva: json['tva'],
      month: json['invoice']['month'],
      year: json['invoice']['year']
      );
  }
}