part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}


final class LoadingUpdatePasswordState extends ProfileState{}


final class UpdatedPasswordState extends ProfileState {
  final String message;

  const UpdatedPasswordState({required this.message});

  @override
  List<Object> get props => [message];
}



final class ErrorUpdatedPasswordState extends ProfileState {
  final String message;

  const ErrorUpdatedPasswordState({required this.message});

  @override
  List<Object> get props => [message];
}