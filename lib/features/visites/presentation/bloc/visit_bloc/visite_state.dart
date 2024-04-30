
import 'package:equatable/equatable.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';

abstract class VisiteState extends Equatable {
  const VisiteState();
  
  @override
  List<Object> get props => [];
}

final class VisiteInitialState extends VisiteState {}


final class LoadingVisiteState extends VisiteState{}

final class LoadedVisiteState extends VisiteState{
  final List<Visite> visites;

  const LoadedVisiteState({required this.visites});

  @override
  List<Object> get props => [visites];
}

final class ErrorVisiteState extends VisiteState{
  final String message;

  const ErrorVisiteState({required this.message});

  @override
  List<Object> get props => [message];
}

final class ExpiredTokenState extends VisiteState{}



final class AddedNewVisiteState extends VisiteState{}


final class UpdatedVisiteState extends VisiteState{}


final class DeletedVisiteState extends VisiteState{
  final int idVisite;

  const DeletedVisiteState({required this.idVisite});

  @override
  List<Object> get props => [idVisite];
}

