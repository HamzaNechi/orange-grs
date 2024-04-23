import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/core/widgets/second_app_bar.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_event.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_state.dart';
import 'package:orange_grs/features/visites/presentation/widgets/add_visit_widgets/add_image_widget.dart';
import 'package:orange_grs/features/visites/presentation/widgets/add_visit_widgets/site_field_addvisite.dart';

class AddVisitePage extends StatelessWidget {
  const AddVisitePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController indexController = TextEditingController();
    TextEditingController commentController = TextEditingController();
    GlobalKey<FormState> keyFormAddNewVisite = GlobalKey<FormState>();
    late Site site;
    late XFile file;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SecondAppBarWidget(contextX: context),
      body: LayoutBuilder(
        builder: (context, constraints) {

          bool isNumeric(String? s) {
            if (s == null) {
              return false;
            }
            return double.tryParse(s) != null;
          }

          


          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.9,
                    height: constraints.maxHeight * 0.12,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Enregistrer votre visite',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: rubikFontMedium,
                                fontWeight: FontWeight.w600,
                                color: secondaryColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Mobile Forms. Inspirational designs, illustrations, and graphic elements from the worlds best designers.',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: rubikFontRegular,
                                fontWeight: FontWeight.w400,
                                color: greyForTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),

                  AddImageWidget(heightContainer: constraints.maxHeight * 0.16, onChoose: (value) {
                    file = value;
                  },),
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.8,
                    child: Form(
                      key: keyFormAddNewVisite,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: indexController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            enableSuggestions: true,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Ecrivez votre commentaire";
                              }

                              if (!isNumeric(value)) {
                                return "Veuillez entrer uniquement des chiffres";
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: 'index compteur',
                                contentPadding: EdgeInsets.all(10)
                                //prefixIcon: Icon(CupertinoIcons.number),
                                ),
                            onChanged: (value) {},
                          ),

                          const SizedBox(
                            height: 8,
                          ),


                          SearchableFieldSiteForAddVisite(
                            onSubmit: (value) {
                              site = value;
                            },
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          TextFormField(
                            controller: commentController,
                            maxLength: 500,
                            maxLines: 5,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Ecrivez votre commentaire";
                              }

                              return null;
                            },
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                                hintText: 'Commentaire',
                                contentPadding: EdgeInsets.all(10)
                                //prefixIcon: Icon(CupertinoIcons.text_aligncenter),
                                ),
                            onChanged: (value) {},
                          ),

                          const SizedBox(
                            height: 16,
                          ),

                          InkWell(
                            onTap: () {
                              
                              if(keyFormAddNewVisite.currentState!.validate()){
                                final Visite visite = Visite(indexCompteur: int.parse(indexController.text), commentaire: commentController.text, site: site);
                                BlocProvider.of<VisiteBloc>(context).add(AddNewVisiteEvent(visite: visite, file: file));
                              }
                            },
                            child: Container(
                                height: 70,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text(
                                    "Enregistrer",
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ),


                          BlocListener<VisiteBloc, VisiteState>(listener: (context, state) {  
                            if(state is ErrorVisiteState){
                              SnackbarMessage().showErrorSnackBar(message: state.message, context: context);
                            }else if(state is AddedNewVisiteState){
                              indexController.text = "";
                              commentController.text = "";
                              SnackbarMessage().showSuccessSnackBar(message: "visite added", context: context);
                              BlocProvider.of<VisiteBloc>(context).add(GettAllVisitesEvent());
                              Navigator.pop(context);
                            }
                          },
                          child: Container(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );


    
  }
}
