import 'package:orange_grs/features/sites/domain/entities/site.dart';

class SiteModel extends Site{
  const SiteModel({super.siteId, required super.elecType, super.siteCode, required super.siteRef});


  factory SiteModel.fromJson(Map<String, dynamic> json){
    return SiteModel(siteId: json['siteId'],elecType: json['elecTypeId'], siteCode: json['siteCode'], siteRef: json['elecMeterRef']);
  }

}