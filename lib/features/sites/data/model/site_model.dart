import 'package:orange_grs/features/sites/domain/entities/site.dart';

class SiteModel extends Site{
  const SiteModel({super.siteId, required super.elecType, super.siteCode, required super.siteRef, super.direction, required super.status, super.networkType, super.configuration, super.estimationConsom, super.siteName, required super.isSharing});


  factory SiteModel.fromJson(Map<String, dynamic> json){
    return SiteModel(
      siteId: json['siteId'],
      elecType: json['elecTypeId']?['description'] ?? '', 
      siteCode: json['siteCode'], 
      siteRef: json['elecMeterRef'],
      configuration: json['configuration'],
      direction: json['directionId']?['description'] ?? '',
      estimationConsom: json['estimatedConsumption'],
      networkType: json['networkTypeId']?['description'] ?? '',
      status: json['statusId']?['description'] ?? '',
      siteName: json['siteName'] ?? '',
      isSharing: json['isSharing']
      );
  }

}