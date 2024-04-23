import 'package:equatable/equatable.dart';



abstract class BottomNavState extends Equatable {
  const BottomNavState();
  
  @override
  List<Object> get props => [];
}





class ShowProfileState extends BottomNavState{
  final bool showProfileAnswer;

  const ShowProfileState({required this.showProfileAnswer});


  @override
  List<Object> get props => [showProfileAnswer];
}