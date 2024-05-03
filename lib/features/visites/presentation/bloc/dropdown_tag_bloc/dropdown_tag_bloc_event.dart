part of 'dropdown_tag_bloc_bloc.dart';

sealed class DropdownTagEvent extends Equatable {
  const DropdownTagEvent();

  @override
  List<Object> get props => [];
}


class DropdownTagSelectItemEvent extends DropdownTagEvent {
  final String selectedItem;
  const DropdownTagSelectItemEvent({required this.selectedItem});

  @override
  List<Object> get props => [selectedItem];
}
