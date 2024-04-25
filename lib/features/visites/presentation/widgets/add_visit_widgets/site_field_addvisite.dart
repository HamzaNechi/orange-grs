import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/visites/presentation/widgets/loading_search_field.dart';
import 'package:searchfield/searchfield.dart';

class SearchableFieldSiteForAddVisite extends StatelessWidget {
  final ValueChanged<Site> onSubmit;
  final ValueChanged<bool> checkSharingSite;
  const SearchableFieldSiteForAddVisite({super.key, required this.onSubmit, required this.checkSharingSite});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SiteBloc, SiteState>(
                            builder: (context, state) {
                              if(state is LoadedSiteState){
                                return SearchField<Site>(             
                                  searchInputDecoration: const InputDecoration(
                                      hintText: 'Séléctionner un site',
                                      contentPadding: EdgeInsets.all(10)
                                      //prefixIcon: Icon(CupertinoIcons.number),
                                      ),
                                  itemHeight: 40,
                                  validator: (p0) {
                                    if(p0!.isEmpty){
                                      return "Champ obligatoire !";
                                    }

                                    return null;
                                  },
                                  maxSuggestionsInViewPort: 5,
                                  textInputAction: TextInputAction.next,
                                  onSuggestionTap: (p) {
                                    //siteController.text = p.item!.siteCode!;
                                    onSubmit(p.item!);
                                    checkSharingSite(p.item!.isSharing == 1);
                                  },
                    
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
                                return const LoadingSearchFieldWidget();
                              }else if(state is ErrorSiteState){
                                return const LoadingSearchFieldWidget();
                              }

                              return const LoadingSearchFieldWidget();
                              
                            },
                          );
  }
}