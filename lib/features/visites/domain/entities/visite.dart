import 'package:equatable/equatable.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';

class Visite extends Equatable{

  final int? visiteId;
  final int indexCompteur;
  final String? photoCompteur;
  final DateTime? dateInsertion;
  final String commentaire;
  final String? responsable;
  final Site site;
  final int otn;
  final int oo;
  final int tt;
  final double indexOO;
  final double indexTT;

  const Visite({this.visiteId, 
  required this.indexCompteur, 
  this.photoCompteur, 
  this.dateInsertion, 
  required this.commentaire, 
  this.responsable, 
  required this.site,
  required this.otn, 
  required this.oo, 
  required this.tt,
  required this.indexOO, 
  required this.indexTT
  });
  
   
  @override
  List<Object?> get props => [visiteId,indexCompteur,photoCompteur,dateInsertion,commentaire,responsable,site,indexOO,indexTT];

}