import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/utils/image_ocr_model.dart';

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


  Future<RetourOcrWithCropImage> captureCameraWithOcrValue()async{
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    final String ocrValue = await textRecognition(file!);
    return RetourOcrWithCropImage(file: file, ocrValue: ocrValue);
  }


  Future textRecognition(XFile image) async{
    String text="";
    XFile? croppedImage = await cropImage(image);
    final textRecognizer= TextRecognizer(script: TextRecognitionScript.latin);
    final inputImage = InputImage.fromFilePath(croppedImage!.path);
    final RecognizedText recognizedText= await textRecognizer.processImage(inputImage);
    for(TextBlock block in recognizedText.blocks){
        for(TextLine line in block.lines){
          text="$text${line.text}\n";
        }
    }
    return text.replaceAll(RegExp(r'[^0-9]'), '');
  }



  Future<XFile?> cropImage(XFile image) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Préciser l'index",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Préciser l'index",
          )
        ]
    );

    if(croppedFile == null) return null;
    return XFile(croppedFile.path);
  }



}