
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';

class VisiteEvent extends Equatable {
  const VisiteEvent();

  @override
  List<Object> get props => [];
}


class GettAllVisitesEvent extends VisiteEvent{}

class AddNewVisiteEvent extends VisiteEvent{
  final Visite visite;
  final XFile file;

  const AddNewVisiteEvent({required this.visite, required this.file});

  @override
  List<Object> get props => [visite, file];
}
