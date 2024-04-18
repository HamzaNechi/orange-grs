import 'package:orange_grs/features/sites/data/model/site_model.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';

class VisiteModel extends Visite{
  const VisiteModel({
    required super.visiteId, 
    required super.indexCompteur, 
    required super.photoCompteur, 
    required super.dateInsertion, 
    required super.commentaire, 
    required super.responsable, 
    required super.site});


    factory VisiteModel.fromJson(Map<String, dynamic> json){
      DateTime dateTimeInsertion = DateTime.parse(json['dateInsertion']);
      return VisiteModel(
        visiteId: json['visiteId'], 
        indexCompteur: json['indexCompteur'], 
        photoCompteur: json['photoCompteur'], 
        dateInsertion: dateTimeInsertion, 
        commentaire: json['commentaire'], 
        responsable: json['login']['login'], 
        site: SiteModel.fromJson(json['site']));
    }


    Map<String, dynamic> toJson(){
      return {
        'visiteId' : visiteId,
        'indexCompteur' : indexCompteur,
        'photoCompteur' : photoCompteur,
        'dateInsertion' : dateInsertion,
        'commentaire' : commentaire,
        'login' : responsable,
        'site' : site
      };
    }

}