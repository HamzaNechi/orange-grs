import 'package:orange_grs/features/sites/domain/entities/site.dart';

class SiteModel extends Site{
  const SiteModel({super.siteId, required super.elecType, super.siteCode, required super.siteRef, super.direction, required super.status, super.networkType, super.configuration, super.estimationConsom, super.siteName, required super.isSharing});


  factory SiteModel.fromJson(Map<String, dynamic> json){
    return SiteModel(
      siteId: json['siteId'],
      elecType: json['elecTypeId']?['elecTypeId'] ?? 0, 
      siteCode: json['siteCode'] ?? 'sans code', 
      siteRef: json['elecMeterRef'],
      configuration: json['configuration'] ?? 'sans configuration',
      direction: json['directionId']?['description'] ?? 'sans direction',
      estimationConsom: json['estimatedConsumption'],
      networkType: json['networkTypeId']?['description'] ?? 'sans network type',
      status: json['statusId']?['description'] ?? '',
      siteName: json['siteName'] ?? 'sans name',
      isSharing: json['isSharing']
      );
  }

}