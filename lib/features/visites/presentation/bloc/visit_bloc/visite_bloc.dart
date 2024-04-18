import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/utils/global_function_utils.dart';
import 'package:orange_grs/features/visites/domain/usecases/add_new_visite_use_case.dart';
import 'package:orange_grs/features/visites/domain/usecases/get_all_visite_use_case.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_event.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_state.dart';


class VisiteBloc extends Bloc<VisiteEvent, VisiteState> {
  final GetAllVisiteUseCase getAllVisiteUseCase;
  final AddNewVisiteUseCase addNewVisiteUseCase;
  VisiteBloc({required this.getAllVisiteUseCase, required this.addNewVisiteUseCase}) : super(VisiteInitialState()) {
    on<VisiteEvent>((event, emit) async{
      emit(LoadingVisiteState());
      if(event is GettAllVisitesEvent){
        final failureOrVisites = await getAllVisiteUseCase.call();
        failureOrVisites.fold(
          (failure) {
            String errorMessage = GlobalFunctionUtils.mapFailureToMessage(failure);
            emit(ErrorVisiteState(message: errorMessage));
          },
          (visites) {
            emit(LoadedVisiteState(visites: visites));
          },);  
      }else if(event is AddNewVisiteEvent){
        final failureOrAddedVisit = await addNewVisiteUseCase.call(event.visite, event.file);

        failureOrAddedVisit.fold(
          (failure) {
            String errorMessage = GlobalFunctionUtils.mapFailureToMessage(failure);
            emit(ErrorVisiteState(message: errorMessage));
          }, 
          (added) {
            emit(AddedNewVisiteState());
          }
          );
      }
    });
  }
}
