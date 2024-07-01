import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/core/strings/urls.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/visites/presentation/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_event.dart';

class AddImageWidget extends StatelessWidget {
  final String? pathImage;
  final ValueChanged<XFile> onChoose;
  final double heightContainer;
  const AddImageWidget({super.key, required this.heightContainer, required this.onChoose, this.pathImage});

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: heightContainer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: secondaryColor),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                context.read<ImagePickerBloc>().add(CameraCaptureEvent());
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: whiteColor,
                        style: BorderStyle.solid,
                        width: 3,
                        strokeAlign: BorderSide.strokeAlignInside)),
                child: BlocConsumer<ImagePickerBloc, ImagePickerState>(

                  listener: (context, state) {
                    if(state is ErrorImagePickedState){
                      SnackbarMessage().showErrorSnackBar(message: "Une erreur inattendue s'est produite lors du choix de l'image. Veuillez réessayer ultérieurement.", context: context);
                    }
                  },
                  builder: (context, state) {

                    if(state is ImagePickedState){
                      print('ocr index add image widget = ${state.imageAndOcrText.ocrValue}');
                      BlocProvider.of<VisiteBloc>(context).add(ChangeValueIndexEvent(indexValue: state.imageAndOcrText.ocrValue));
                      onChoose(state.imageAndOcrText.file);
                      return Image.file(
                        File(state.imageAndOcrText.file.path.toString()),
                        fit: BoxFit.cover,
                        );
                    }else{
                      return pathImage == null ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo_outlined,
                          color: whiteColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Image du compteur",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: rubikFontRegular,
                              fontWeight: FontWeight.w400,
                              color: whiteColor),
                        ),
                      ],
                    ) : Image.network("$BASE_URL_PUBLIC/api/images/$pathImage", fit: BoxFit.fill,);
                    }
                    
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
