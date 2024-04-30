import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/errors/failures.dart';
import 'package:orange_grs/core/utils/global_function_utils.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
import 'package:orange_grs/features/visites/domain/usecases/add_new_visite_use_case.dart';
import 'package:orange_grs/features/visites/domain/usecases/delete_visite_usecase.dart';
import 'package:orange_grs/features/visites/domain/usecases/get_all_visite_use_case.dart';
import 'package:orange_grs/features/visites/domain/usecases/update_visite_use_case.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_event.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_state.dart';


class VisiteBloc extends Bloc<VisiteEvent, VisiteState> {
  final GetAllVisiteUseCase getAllVisiteUseCase;
  final AddNewVisiteUseCase addNewVisiteUseCase;
  final DeleteVisiteUseCase deleteVisiteUseCase;
  final UpdateVisiteUseCase updateVisiteUseCase;
  VisiteBloc({required this.getAllVisiteUseCase, required this.addNewVisiteUseCase, required this.deleteVisiteUseCase,required this.updateVisiteUseCase,}) : super(VisiteInitialState()) {
    on<VisiteEvent>((event, emit) async{
      emit(LoadingVisiteState());
      if(event is GettAllVisitesEvent){
        final failureOrVisites = await getAllVisiteUseCase.call(null);
        emit(emitterLoadAndSearchVisit(failureOrVisites));  
      }else if(event is SearchVisiteBySiteEvent){
        final failureOrVisites = await getAllVisiteUseCase.call(event.codeSite);
        emit(emitterLoadAndSearchVisit(failureOrVisites));  
      }else if(event is AddNewVisiteEvent){
        final failureOrAddedVisit = await addNewVisiteUseCase.call(event.visite, event.file);
        emit(emitterDeleteAndAddVisite(failureOrAddedVisit, null));
      }else if(event is DeleteVisiteByIdEvent){
        final failureOrDeleted = await deleteVisiteUseCase.call(event.visiteId);
        emit(emitterDeleteAndAddVisite(failureOrDeleted, event.visiteId));
      }else if(event is UpdateVisiteEvent){
        Either<Failure, String> failureOrUpdated;
        if(event.file == null) {
          failureOrUpdated = await updateVisiteUseCase.call(event.visite, null);
        }else{
          failureOrUpdated = await updateVisiteUseCase.call(event.visite, event.file);
        } 
        emit(emitterDeleteAndAddVisite(failureOrUpdated, null));
      }
    });  
  }



  VisiteState emitterLoadAndSearchVisit(Either<Failure, List<Visite>> failureOrVisites){
      return failureOrVisites.fold(
          (failure) {
            String errorMessage = GlobalFunctionUtils.mapFailureToMessage(failure);
            return ErrorVisiteState(message: errorMessage);
          },
          (visites) {
            return LoadedVisiteState(visites: visites);
          },);
    }


  VisiteState emitterDeleteAndAddVisite(Either<Failure, String> failureOrSuccess, int? visiteId){
      return failureOrSuccess.fold(
          (failure) {
            String errorMessage = GlobalFunctionUtils.mapFailureToMessage(failure);
            return ErrorVisiteState(message: errorMessage);
          }, 
          (success) {
            print("sucess body string add and delete visite $success");
            if(success == "deleted" && visiteId != null){
              return DeletedVisiteState(idVisite: visiteId);
            }else if(success == "success update"){
              return UpdatedVisiteState();
            }else{
              return AddedNewVisiteState();
            }
          }
          );
    }
}
