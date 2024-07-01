import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/reclamation/domain/entities/reclamation.dart';
import 'package:orange_grs/features/reclamation/presentation/blocs/reclamation_bloc/reclamation_bloc.dart';

class ReclamationFormWidget extends StatefulWidget {
  const ReclamationFormWidget({super.key});

  @override
  State<ReclamationFormWidget> createState() => _ReclamationFormWidgetState();
}

class _ReclamationFormWidgetState extends State<ReclamationFormWidget> {
  TextEditingController problemeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int selectedRadioItem = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReclamationBloc, ReclamationState>(
      listener: (context, state) {
        if(state is ResetFormReclamationState){
          problemeController.text = "";
          descriptionController.text = "";
          selectedRadioItem = 1;
          setState(() {
            
          });
        }
      },
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadioListTile(
            title: Text("Problème d'enregistrement de visite.",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: rubikFontMedium,
                    fontWeight: FontWeight.w600,
                    color: selectedRadioItem == 1
                        ? secondaryColor
                        : greyForTextColor)),
            value: 1,
            activeColor: primaryColor,
            groupValue: selectedRadioItem,
            onChanged: (value) {
              setState(() {
                selectedRadioItem = value!;
              });
            },
          ),
          RadioListTile(
            title: Text("Manque d'informations sur le site.",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: rubikFontMedium,
                    fontWeight: FontWeight.w600,
                    color: selectedRadioItem == 2
                        ? secondaryColor
                        : greyForTextColor)),
            value: 2,
            groupValue: selectedRadioItem,
            activeColor: primaryColor,
            onChanged: (value) {
              setState(() {
                selectedRadioItem = value!;
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: problemeController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            enableSuggestions: true,
            decoration: const InputDecoration(
                hintText: 'Probléme', contentPadding: EdgeInsets.all(10)),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: descriptionController,
            maxLength: 500,
            maxLines: 5,
            validator: (value) {
              if (value!.isEmpty) {
                return "Champ obligatoire !";
              }

              return null;
            },
            textInputAction: TextInputAction.newline,
            decoration: const InputDecoration(
                hintText: 'Description', contentPadding: EdgeInsets.all(10)),
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              final Reclamation reclamation = Reclamation(
                  objet: selectedRadioItem == 1
                      ? "Problème d'enregistrement de visite."
                      : "Manque d'informations sur le site.",
                  problem: problemeController.text,
                  description: descriptionController.text);

              BlocProvider.of<ReclamationBloc>(context)
                  .add(AddReclamationEvent(reclamation: reclamation));
            },
            child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    "Envoyer",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          )
        ],
      )),
    );
  }
}
