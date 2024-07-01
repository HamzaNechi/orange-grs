import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/utils/global_function_utils.dart';
import 'package:orange_grs/features/reclamation/domain/entities/reclamation.dart';
import 'package:orange_grs/features/reclamation/domain/usecase/add_new_reclamation_usecase.dart';

part 'reclamation_event.dart';
part 'reclamation_state.dart';

class ReclamationBloc extends Bloc<ReclamationEvent, ReclamationState> {
  final AddNewReclamationUseCase useCaseAddReclamation;
  ReclamationBloc({required this.useCaseAddReclamation}) : super(ReclamationInitial()) {
    on<ReclamationEvent>((event, emit)async {

      if(event is AddReclamationEvent){
        final failureOrReclamation = await useCaseAddReclamation.call(event.reclamation);
        failureOrReclamation.fold(
          (failure) {
            if(failure is ExpiredJwtFailure){
              emit(ExpiredJwtState(message: GlobalFunctionUtils.mapFailureToMessage(failure)));
            }else{
              emit(ErrorReclamationState(message: GlobalFunctionUtils.mapFailureToMessage(failure)));
            }
          }, 
          (success) => emit(const NewReclamationAddedState(message: "Votre réclamation a bien été envoyée à l'administration.")));
      }else if (event is ResetFormReclamationEvent){
        emit(ResetFormReclamationState());
      }
    });
  }
}
