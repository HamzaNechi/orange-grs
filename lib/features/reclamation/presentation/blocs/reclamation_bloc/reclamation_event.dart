part of 'reclamation_bloc.dart';

sealed class ReclamationEvent extends Equatable {
  const ReclamationEvent();

  @override
  List<Object> get props => [];
}



class AddReclamationEvent extends ReclamationEvent{
  final Reclamation reclamation;

  const AddReclamationEvent({required this.reclamation});

  @override
  List<Object> get props => [reclamation];
}


class ResetFormReclamationEvent extends ReclamationEvent{}
