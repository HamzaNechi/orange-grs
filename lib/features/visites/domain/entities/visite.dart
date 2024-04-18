import 'package:equatable/equatable.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';

class Visite extends Equatable{

  final int? visiteId;
  final int indexCompteur;
  final String photoCompteur;
  final DateTime dateInsertion;
  final String commentaire;
  final String responsable;
  final Site site;

  const Visite({required this.visiteId, 
  required this.indexCompteur, 
  required this.photoCompteur, 
  required this.dateInsertion, 
  required this.commentaire, 
  required this.responsable, 
  required this.site
  });
  
   
  @override
  List<Object?> get props => [visiteId,indexCompteur,photoCompteur,dateInsertion,commentaire,responsable,site];

}