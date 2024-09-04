part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}



class UpdateProfilePasswordEvent extends ProfileEvent{
  final String newPassword;

  const UpdateProfilePasswordEvent({required this.newPassword});


  @override
  List<Object> get props => [newPassword];
}
