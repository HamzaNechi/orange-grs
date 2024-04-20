import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';



abstract class BottomNavState extends Equatable {
  const BottomNavState();
  
  @override
  List<Object> get props => [];
}


class BottomNavHomeWidgetState extends BottomNavState{
  final String titleAppBar;
  final Widget page;
  final int index;

  const BottomNavHomeWidgetState({required this.titleAppBar, required this.page, required this.index});

  @override
  List<Object> get props => [titleAppBar, index, page];
}


class BottomNavSiteWidgetState extends BottomNavState{
  final String titleAppBar;
  final Widget page;
  final int index;

  const BottomNavSiteWidgetState({required this.titleAppBar, required this.page, required this.index});

  @override
  List<Object> get props => [titleAppBar, index, page];
}


class BottomNavVisiteWidgetState extends BottomNavState{
  final String titleAppBar;
  final Widget page;
  final int index;

  const BottomNavVisiteWidgetState({required this.titleAppBar, required this.page, required this.index});

  @override
  List<Object> get props => [titleAppBar, index, page];
}



class ShowProfileState extends BottomNavState{
  final bool showProfileAnswer;

  const ShowProfileState({required this.showProfileAnswer});


  @override
  List<Object> get props => [showProfileAnswer];
}