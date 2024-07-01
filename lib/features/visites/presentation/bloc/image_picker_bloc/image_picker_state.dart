import 'package:equatable/equatable.dart';
import 'package:orange_grs/core/utils/image_ocr_model.dart';



abstract class ImagePickerState extends Equatable {

  @override
  List<Object> get props => [];
}

class InitImagePickerState extends ImagePickerState{}


class ImagePickedState extends ImagePickerState{
  final RetourOcrWithCropImage imageAndOcrText;
  ImagePickedState({required this.imageAndOcrText});

  
  @override
  List<Object> get props => [imageAndOcrText];
}

class ErrorImagePickedState extends ImagePickerState{}
