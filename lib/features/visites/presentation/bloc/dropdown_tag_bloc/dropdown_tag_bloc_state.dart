part of 'dropdown_tag_bloc_bloc.dart';

sealed class DropdownTagState extends Equatable {
  const DropdownTagState();
  
  @override
  List<Object> get props => [];
}

final class DropdownTagInitial extends DropdownTagState {}

class DropdownTagSelectedItemState extends DropdownTagState {
  final String selectedItem;
  const DropdownTagSelectedItemState({required this.selectedItem});

  @override
  List<Object> get props => [selectedItem];
}
