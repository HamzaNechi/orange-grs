
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dropdown_tag_bloc_event.dart';
part 'dropdown_tag_bloc_state.dart';

class DropdownTagBlocBloc extends Bloc<DropdownTagEvent, DropdownTagState> {
  DropdownTagBlocBloc() : super(DropdownTagInitial()) {
    on<DropdownTagEvent>((event, emit) {
      if(event is DropdownTagSelectItemEvent){
        emit(DropdownTagSelectedItemState(selectedItem: event.selectedItem));
      }
    });
  }
}
