part of 'reclamation_bloc.dart';

sealed class ReclamationState extends Equatable {
  const ReclamationState();
  
  @override
  List<Object> get props => [];
}

final class ReclamationInitial extends ReclamationState {}

final class NewReclamationAddedState extends ReclamationState {
  final String message;

  const NewReclamationAddedState({required this.message});

  @override
  List<Object> get props => [message];
}

final class ErrorReclamationState extends ReclamationState {
  final String message;

  const ErrorReclamationState({required this.message});

  @override
  List<Object> get props => [message];
}


final class ExpiredJwtState extends ReclamationState{
  final String message;

  const ExpiredJwtState({required this.message});

  @override
  List<Object> get props => [message];
}


final class ResetFormReclamationState extends ReclamationState {}
