import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/core/widgets/second_app_bar.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/visites/presentation/widgets/add_image_widget.dart';
import 'package:searchfield/searchfield.dart';

class AddVisitePage extends StatelessWidget {
  const AddVisitePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController indexController = TextEditingController();
    TextEditingController siteController = TextEditingController();
    TextEditingController commentController = TextEditingController();
    GlobalKey<FormState> keyFormAddNewVisite = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SecondAppBarWidget(contextX: context),
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                  AddImageWidget(heightContainer: constraints.maxHeight * 0.16),
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

                          // TextFormField(
                          //   controller: siteController,
                          //   textInputAction: TextInputAction.next,
                          //   decoration: const InputDecoration(
                          //     contentPadding: EdgeInsets.all(10),
                          //     hintText: 'Entrer le site',
                          //    // prefixIcon: Icon(CupertinoIcons.location),
                          //   ),
                          //   onChanged: (value) {
                          //   },

                          // ),

                          BlocBuilder<SiteBloc, SiteState>(
                            builder: (context, state) {
                              if(state is LoadedSiteState){
                                return SearchField<Site>(
                                  controller: siteController,
                
                                  searchInputDecoration: const InputDecoration(
                                      hintText: 'Séléctionner le site',
                                      contentPadding: EdgeInsets.all(10)
                                      //prefixIcon: Icon(CupertinoIcons.number),
                                      ),
                                  itemHeight: 40,
                                  maxSuggestionsInViewPort: 5,
                                  textInputAction: TextInputAction.next,
                                  suggestionsDecoration: SuggestionDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      padding: const EdgeInsets.all(10)),
                                  suggestionStyle: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: rubikFontRegular,
                                      fontWeight: FontWeight.w400,
                                      color: secondaryColor),
                                  suggestions: state.sites.map((site) => SearchFieldListItem<Site>(site.siteCode.toString() , item: site)).toList()
                                  );
                              }else if(state is LoadingSiteState){
                                return const CircularProgressIndicator();
                              }else if(state is ErrorSiteState){
                                return const CircularProgressIndicator();
                              }

                              return const CircularProgressIndicator();
                              
                            },
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          TextFormField(
                            controller: commentController,
                            maxLength: 500,
                            maxLines: 5,
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
                            onTap: () {},
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
