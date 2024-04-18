import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/visites/presentation/bloc/image_picker_bloc/bloc/image_picker_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/image_picker_bloc/bloc/image_picker_state.dart';

class AddImageWidget extends StatelessWidget {
  final double heightContainer;
  const AddImageWidget({super.key, required this.heightContainer});

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
                child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                  builder: (context, state) {
                    return state.file == null ? const Row(
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
                    ) : Image.file(
                      File(state.file!.path.toString()),
                      fit: BoxFit.cover,
                      );
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
