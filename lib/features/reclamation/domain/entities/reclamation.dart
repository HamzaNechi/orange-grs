import 'package:equatable/equatable.dart';

class Reclamation extends Equatable{
  final int? reclamationId;
  final String objet;
  final String problem;
  final String description;

  const Reclamation(
    {
      this.reclamationId, 
      required this.objet, 
      required this.problem, 
      required this.description
    }
  );



  @override
  List<Object?> get props => [reclamationId,objet,problem,description];

}