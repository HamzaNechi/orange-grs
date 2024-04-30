import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/core/utils/global_function_utils.dart';
import 'package:orange_grs/core/widgets/second_app_bar.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
import 'package:orange_grs/features/visites/presentation/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_event.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_state.dart';
import 'package:orange_grs/features/visites/presentation/widgets/add_visit_widgets/add_image_widget.dart';
import 'package:orange_grs/features/visites/presentation/widgets/add_visit_widgets/site_field_addvisite.dart';

class UpdateVisitePage extends StatelessWidget {
  final Visite visite;
  const UpdateVisitePage({super.key, required this.visite});


  @override
  Widget build(BuildContext context) {
    TextEditingController indexController = TextEditingController();
    TextEditingController commentController = TextEditingController();
    TextEditingController otnController = TextEditingController();
    TextEditingController ooController = TextEditingController();
    TextEditingController ttController = TextEditingController();
    GlobalKey<FormState> keyFormAddNewVisite = GlobalKey<FormState>();
    indexController.text = visite.indexCompteur.toString();
    commentController.text = GlobalFunctionUtils.normalizeString(visite.commentaire);
    otnController.text = visite.otn.toString();
    ooController.text = visite.oo.toString();
    ttController.text = visite.tt.toString();
    Site? site = visite.site ;
    XFile? file;
    bool isSharing = visite.site.isSharing == 1;
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
                            'Modifier votre visite',
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

                  AddImageWidget(
                    heightContainer: constraints.maxHeight * 0.16, 
                    onChoose: (value) {
                      file = value;
                    },
                    pathImage: visite.photoCompteur,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.8,
                    child: Form(
                      key: keyFormAddNewVisite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          //index compteur

                          const Text(
                            'Index',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: rubikFontMedium,
                                fontWeight: FontWeight.w500,
                                color: secondaryColor)),

                              const SizedBox(height: 5,),


                          TextFormField(
                            controller: indexController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            enableSuggestions: true,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Champ obligatoire !";
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



                          //site
                          const Text(
                            'Site',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: rubikFontMedium,
                                fontWeight: FontWeight.w500,
                                color: secondaryColor)),

                              const SizedBox(height: 5,),


                          SearchableFieldSiteForAddVisite(
                            siteCode: site!.siteCode,
                            onSubmit: (value) {
                              site = value;
                            },
                            checkSharingSite: (value) {
                              isSharing = value;
                            },
                          ),


                          Visibility(
                            visible: isSharing,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                const SizedBox(
                                  height: 8,
                                ),


                                //ampérage otn
                                const Text(
                                'Ampérage OTN',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: rubikFontMedium,
                                    fontWeight: FontWeight.w500,
                                    color: secondaryColor)),

                                  const SizedBox(height: 5,),


                                TextFormField(
                                  controller: otnController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType:  TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: 'Ampérage OTN',
                                      contentPadding: EdgeInsets.all(10)
                                      //prefixIcon: Icon(CupertinoIcons.text_aligncenter),
                                      ),
                                  onChanged: (value) {
                                    if(!isSharing){
                                      otnController.text = '0';
                                    }
                                  },
                                ),


                                const SizedBox(
                                  height: 8,
                                ),


                                //ampérage ooredoo


                                const Text(
                                'Ampérage OO',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: rubikFontMedium,
                                    fontWeight: FontWeight.w500,
                                    color: secondaryColor)),

                                  const SizedBox(height: 5,),


                                TextFormField(
                                  controller: ooController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType:  TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: 'Ampérage OO',
                                      contentPadding: EdgeInsets.all(10)
                                      //prefixIcon: Icon(CupertinoIcons.text_aligncenter),
                                      ),
                                  onChanged: (value) {
                                    if(!isSharing){
                                      ooController.text = '0';
                                    }
                                  },
                                ),


                                const SizedBox(
                                  height: 8,
                                ),


                                //ampérage tunisie télécom

                                const Text(
                                'Ampérage TT',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: rubikFontMedium,
                                    fontWeight: FontWeight.w500,
                                    color: secondaryColor)),

                                  const SizedBox(height: 5,),


                                TextFormField(
                                  controller: ttController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType:  TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: 'Ampérage TT',
                                      contentPadding: EdgeInsets.all(10)
                                      ),
                                  onChanged: (value) {
                                    if(!isSharing){
                                      ttController.text = '0';
                                    }
                                  },
                                ),
                              ],
                            )),


                          const SizedBox(
                            height: 8,
                          ),


                          //commentaire

                          const Text(
                            'Commentaire',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: rubikFontMedium,
                                fontWeight: FontWeight.w500,
                                color: secondaryColor)),

                              const SizedBox(height: 5,),

                          TextFormField(
                            controller: commentController,
                            maxLength: 500,
                            maxLines: 5,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Champ obligatoire !";
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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  if(isSharing){
                                    if(otnController.text.isEmpty){
                                      otnController.text = "0";
                                    }else if(ooController.text.isEmpty){
                                      ooController.text = "0";
                                    }else if(ttController.text.isEmpty){
                                      ttController.text = "0";
                                    }
                                  }else{
                                    ttController.text = "0";
                                    ooController.text = "0";
                                    otnController.text = "0";
                                  }
                              
                                  
                                  if(keyFormAddNewVisite.currentState!.validate() && site != null){
                                    print("visite id from button modifier = ${visite.visiteId}");
                                    final Visite newVisite = Visite(
                                      visiteId: visite.visiteId,
                                      indexCompteur: int.parse(indexController.text), 
                                      commentaire: commentController.text, 
                                      site: site!, 
                                      oo: int.parse(ooController.text),
                                      otn: int.parse(otnController.text),
                                      tt: int.parse(ttController.text),
                                      );

                                    if(file == null){
                                      BlocProvider.of<VisiteBloc>(context).add(UpdateVisiteEvent(visite: newVisite, file: null));
                                    }else{
                                      BlocProvider.of<VisiteBloc>(context).add(UpdateVisiteEvent(visite: newVisite, file: file));

                                    }
                                    
                                    
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
                                        "Modifier",
                                        style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                              ),
                            ],
                          ),


                          BlocListener<VisiteBloc, VisiteState>(listener: (context, state) {  
                            if(state is ErrorVisiteState){
                              SnackbarMessage().showErrorSnackBar(message: state.message, context: context);
                            }else if(state is UpdatedVisiteState){
                              BlocProvider.of<ImagePickerBloc>(context).add(DeleteImagePickedEvent());
                              SnackbarMessage().showSuccessSnackBar(message: "La visite a été modifiée.", context: context);
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
