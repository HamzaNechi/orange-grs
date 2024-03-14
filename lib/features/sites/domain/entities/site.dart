import 'package:equatable/equatable.dart';

class Site extends Equatable{

  final int? siteId;
  final int elecType;
  final String? siteCode;
  final String siteRef;

  const Site({required this.siteId, required this.elecType, this.siteCode, required this.siteRef});


  @override
  List<Object?> get props => [siteId,elecType,siteCode,siteRef];
}