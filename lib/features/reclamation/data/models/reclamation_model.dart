import 'package:orange_grs/features/reclamation/domain/entities/reclamation.dart';

class ReclamationModel extends Reclamation{


  const ReclamationModel(
    {
      super.reclamationId, 
      required super.objet, 
      required super.problem, 
      required super.description
    }
  );



  factory ReclamationModel.fromJson(Map<String,dynamic> json){
    return ReclamationModel(
      reclamationId: json['reclamationId'] ?? '', 
      objet: json['objet'] ?? '', 
      problem: json['probleme'] ?? '',  
      description: json['description'] ?? '', 
      );
  }


  Map<String, dynamic> toJson() {
    return {
      'objet': objet,
      'probleme': problem,
      'description': description,
    };
  }

}