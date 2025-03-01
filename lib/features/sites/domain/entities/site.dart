
import 'package:equatable/equatable.dart';

class Site extends Equatable{

  final int? siteId;
  final int elecType;
  final String? siteCode;
  final int siteRef;
  final String? direction;
  final String status;
  final String? networkType;
  final String? configuration;
  final int? estimationConsom;
  final String? siteName;
  final bool isSharing;

  const Site({required this.siteId, required this.elecType, this.siteCode, required this.siteRef, this.direction,required this.status, this.networkType,this.configuration,this.estimationConsom,this.siteName, required this.isSharing });


  @override
  List<Object?> get props => [siteId,elecType,siteCode,siteRef, direction, status, networkType,configuration, estimationConsom, siteName, isSharing];
}