
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


class SearchVisiteBySiteEvent extends VisiteEvent{
  final String codeSite;

  const SearchVisiteBySiteEvent({required this.codeSite});

  @override
  List<Object> get props => [codeSite];
}

class DeleteVisiteByIdEvent extends VisiteEvent{
  final int visiteId;

  const DeleteVisiteByIdEvent({required this.visiteId});

  @override
  List<Object> get props => [visiteId];
}


class UpdateVisiteEvent extends VisiteEvent{
  final Visite visite;
  final XFile? file;

  const UpdateVisiteEvent({required this.visite, this.file});

  @override
  List<Object> get props => [visite,file!];
}


class ChangeValueIndexEvent extends VisiteEvent{
  final String indexValue;

  const ChangeValueIndexEvent({required this.indexValue});

  @override
  List<Object> get props => [indexValue];
}


class ChangeValueIndexAddVisitEvent extends VisiteEvent{
  final String indexValue;

  const ChangeValueIndexAddVisitEvent({required this.indexValue});

  @override
  List<Object> get props => [indexValue];
}


