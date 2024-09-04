import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/features/auth/domain/entities/user.dart';
import 'package:orange_grs/features/auth/domain/usecases/update_password_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateUserPasswordUseCase updateUserPasswordUseCase;
  ProfileBloc({required this.updateUserPasswordUseCase}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async{
      emit(LoadingUpdatePasswordState());
      if(event is UpdateProfilePasswordEvent){
        final Either<Failure, User> failurOrupdated = await updateUserPasswordUseCase.call(event.newPassword);
        failurOrupdated.fold(
          (failure) {
            emit(const ErrorUpdatedPasswordState(message: 'Probléme lors de la modification du mot de passe'));
          },
          (user) {
            emit(const UpdatedPasswordState(message: 'Mot de passe modifier avec succée'));
          },
        );
      }
    });
  }
}
