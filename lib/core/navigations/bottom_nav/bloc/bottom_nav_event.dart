import 'package:equatable/equatable.dart';


abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}




class ShowProfileEvent extends BottomNavEvent{
  final bool showProfile;

  const ShowProfileEvent({required this.showProfile});


  @override
  List<Object> get props => [showProfile];
}