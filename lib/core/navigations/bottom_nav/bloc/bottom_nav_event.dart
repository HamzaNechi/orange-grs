import 'package:equatable/equatable.dart';


abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}


class BottomNavOnChangeEvent extends BottomNavEvent{
  final int index;

  const BottomNavOnChangeEvent({required this.index});


  @override
  List<Object> get props => [index];
}