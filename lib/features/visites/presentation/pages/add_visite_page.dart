import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
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

class AddVisitePage extends StatelessWidget {
  const AddVisitePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController indexController = TextEditingController();
    TextEditingController commentController = TextEditingController();
    TextEditingController otnController = TextEditingController();
    TextEditingController ooController = TextEditingController();
    TextEditingController ttController = TextEditingController();
    TextEditingController indexOOController = TextEditingController();
    TextEditingController indexTTController = TextEditingController();
    GlobalKey<FormState> keyFormAddNewVisite = GlobalKey<FormState>();
    late Site? site;
    late XFile? file;
    bool isSharing = false;
    String siteCode = '';


    return BlocListener<VisiteBloc, VisiteState>(
      listener: (context, state) {
        if (state is ChangeValueIndexState) {
          print('ocr change index 55555555555555 ${state.indexValue}');
          if(indexController.text.isEmpty){
            indexController.text = state.indexValue;
          }         
        }else if(state is ChangeValueIndexAddVisiteState){
          print('hethy mta3 l add wa7adha index = ${state.indexValue}');
          indexController.text = state.indexValue;
        }
      },
      child: Scaffold(
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
                              "Si la lecture de l'index ne fonctionne pas, veuillez remplir le champ manuellement.",
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
                        print('file add visite page = ${value.path}');
                        file = value;
                      },
                    ),
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
                              enableSuggestions: false,
                              onChanged: (value) {
                                BlocProvider.of<VisiteBloc>(context).add(ChangeValueIndexAddVisitEvent(indexValue: value));
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Champ Obligatoire !";
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
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SearchableFieldSiteForAddVisite(
                              siteCode: siteCode,
                              onSubmit: (value) {
                                site = value;
                                siteCode = value.siteCode!;
                              },
                              checkSharingSite: (value) {
                                print("site sharing add visite = $value");
                                isSharing = value;
                              },
                            ),
                            Visibility(
                              visible: isSharing,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    controller: otnController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText: 'Ampérage OTN',
                                        contentPadding: EdgeInsets.all(10)
                                        //prefixIcon: Icon(CupertinoIcons.text_aligncenter),
                                        ),
                                    onChanged: (value) {
                                      if (!isSharing) {
                                        otnController.text = '0';
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: constraints.maxWidth,
                                    decoration: BoxDecoration(
                                        color: greyEtentColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Ooredoo',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: rubikFontMedium,
                                                fontWeight: FontWeight.w600,
                                                color: secondaryColor),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            controller: ooController,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                hintText: 'Ampérage OO',
                                                contentPadding:
                                                    EdgeInsets.all(10)
                                                //prefixIcon: Icon(CupertinoIcons.text_aligncenter),
                                                ),
                                            onChanged: (value) {
                                              if (!isSharing) {
                                                ooController.text = '0';
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            controller: indexOOController,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                hintText: 'Index OO',
                                                contentPadding:
                                                    EdgeInsets.all(10)
                                                //prefixIcon: Icon(CupertinoIcons.text_aligncenter),
                                                ),
                                            onChanged: (value) {
                                              if (!isSharing) {
                                                indexOOController.text = '0';
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: constraints.maxWidth,
                                    decoration: BoxDecoration(
                                        color: greyEtentColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Tunisie télécom',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: rubikFontMedium,
                                                fontWeight: FontWeight.w600,
                                                color: secondaryColor),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            controller: ttController,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                hintText: 'Ampérage TT',
                                                contentPadding:
                                                    EdgeInsets.all(10)),
                                            onChanged: (value) {
                                              if (!isSharing) {
                                                ttController.text = '0';
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            controller: indexTTController,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                hintText: 'Index TT',
                                                contentPadding:
                                                    EdgeInsets.all(10)
                                                //prefixIcon: Icon(CupertinoIcons.text_aligncenter),
                                                ),
                                            onChanged: (value) {
                                              if (!isSharing) {
                                                indexTTController.text = '0';
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: commentController,
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
                                if (isSharing) {
                                  if (otnController.text.isEmpty) {
                                    otnController.text = "0";
                                  } else if (ooController.text.isEmpty) {
                                    ooController.text = "0";
                                    indexOOController.text = "0";
                                  } else if (ttController.text.isEmpty) {
                                    ttController.text = "0";
                                    indexTTController.text = "0";
                                  }
                                } else {
                                  ttController.text = "0";
                                  ooController.text = "0";
                                  otnController.text = "0";
                                  indexOOController.text = "0";
                                  indexTTController.text = "0";
                                }

                                if (keyFormAddNewVisite.currentState!
                                        .validate() &&
                                    site != null &&
                                    file != null) {
                                  final Visite visite = Visite(
                                      indexCompteur:
                                          int.parse(indexController.text),
                                      commentaire: commentController.text,
                                      site: site!,
                                      oo: int.parse(ooController.text),
                                      otn: int.parse(otnController.text),
                                      tt: int.parse(ttController.text),
                                      indexOO:
                                          double.parse(indexOOController.text),
                                      indexTT:
                                          double.parse(indexTTController.text));
                                  BlocProvider.of<VisiteBloc>(context).add(
                                      AddNewVisiteEvent(
                                          visite: visite, file: file!));
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
                            BlocListener<VisiteBloc, VisiteState>(
                              listener: (context, state) {
                                if (state is ErrorVisiteState) {
                                  SnackbarMessage().showErrorSnackBar(
                                      message: state.message, context: context);
                                } else if (state is AddedNewVisiteState) {
                                  isSharing = false;
                                  indexController.text = "";
                                  commentController.text = "";
                                  ooController.text = "";
                                  ttController.text = "";
                                  otnController.text = "";
                                  site = null;
                                  siteCode = "";
                                  indexOOController.text = "";
                                  indexTTController.text = "";
                                  //delete image picked
                                  file = null;
                                  BlocProvider.of<ImagePickerBloc>(context)
                                      .add(DeleteImagePickedEvent());
                                  SnackbarMessage().showSuccessSnackBar(
                                      message:
                                          "La nouvelle visite a été enregistrée.",
                                      context: context);
                                  BlocProvider.of<VisiteBloc>(context)
                                      .add(GettAllVisitesEvent());
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
      ),
    );
  }
}
