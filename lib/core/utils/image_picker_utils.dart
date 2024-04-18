import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{
  final ImagePicker picker = ImagePicker();



  Future<XFile?> captureCamera()async{
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }


  Future<XFile?> pickImageFromGallery()async{
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }
}