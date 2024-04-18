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

  const Visite({this.visiteId, 
  required this.indexCompteur, 
  this.photoCompteur, 
  this.dateInsertion, 
  required this.commentaire, 
  this.responsable, 
  required this.site
  });
  
   
  @override
  List<Object?> get props => [visiteId,indexCompteur,photoCompteur,dateInsertion,commentaire,responsable,site];

}