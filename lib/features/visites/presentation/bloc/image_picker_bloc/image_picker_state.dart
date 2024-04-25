import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';



abstract class ImagePickerState extends Equatable {

  @override
  List<Object> get props => [];
}

class InitImagePickerState extends ImagePickerState{}


class ImagePickedState extends ImagePickerState{
  final XFile file;
  ImagePickedState({required this.file});

  
  @override
  List<Object> get props => [file];
}

class ErrorImagePickedState extends ImagePickerState{}
