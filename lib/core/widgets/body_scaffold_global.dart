import 'package:flutter/material.dart';
import 'package:collection/collection.dart';



class BodyScaffoldGlobal extends InheritedWidget{
  int indexScaffold = 0;
  Widget child;

  BodyScaffoldGlobal({
    required this.child,
    super.key,
  }) : super(child: child);
  
  
  @override
  bool updateShouldNotify(BodyScaffoldGlobal oldWidget) {
    Iterable<dynamic> iterableIndexScaffold = [indexScaffold];
    Iterable<dynamic> iterableOldIndexScaffold = [oldWidget.indexScaffold];
    return !const IterableEquality().equals(iterableIndexScaffold, iterableOldIndexScaffold);
  }

  static BodyScaffoldGlobal? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BodyScaffoldGlobal>();
  }

}