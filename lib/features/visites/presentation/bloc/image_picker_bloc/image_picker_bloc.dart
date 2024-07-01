import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/utils/image_ocr_model.dart';
import 'package:orange_grs/core/utils/image_picker_utils.dart';
import 'package:orange_grs/features/visites/presentation/bloc/image_picker_bloc/image_picker_state.dart';

part 'image_picker_event.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(InitImagePickerState()) {
    on<CameraCaptureEvent>((event, emit)async{
      RetourOcrWithCropImage? imgAndOcrIndex = await imagePickerUtils.captureCameraWithOcrValue();
      try{
        emit(ImagePickedState(imageAndOcrText: imgAndOcrIndex));
      }catch(e){
        emit(ErrorImagePickedState());
      }    
    },);


    on<DeleteImagePickedEvent>((event, emit)async{
      emit(InitImagePickerState());
    },);
    
  }
}
